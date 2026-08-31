#!/usr/bin/env bash
set -u

ROUND_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REF_DIR="$ROUND_DIR/reference"
APP_DIR="$REF_DIR/app"
PASS=0
FAIL=0

pass() {
  printf '[PASS] %s\n' "$1"
  PASS=$((PASS + 1))
}

fail() {
  printf '[FAIL] %s\n' "$1"
  FAIL=$((FAIL + 1))
}

check_file() {
  if [[ -f "$1" ]]; then
    pass "file exists: ${1#$ROUND_DIR/}"
  else
    fail "missing file: ${1#$ROUND_DIR/}"
  fi
}

printf '=== B5-2 Reference Verification ===\n'

for path in \
  "$REF_DIR/requirements.txt" \
  "$APP_DIR/main.py" \
  "$APP_DIR/database.py" \
  "$APP_DIR/routers/home.py" \
  "$APP_DIR/routers/memos.py" \
  "$APP_DIR/services/memo_service.py" \
  "$APP_DIR/repositories/memo_repository.py" \
  "$APP_DIR/models/memo.py" \
  "$APP_DIR/templates/base.html" \
  "$APP_DIR/templates/home.html" \
  "$APP_DIR/templates/memos/list.html" \
  "$APP_DIR/templates/memos/detail.html" \
  "$APP_DIR/templates/memos/form.html" \
  "$APP_DIR/templates/not_found.html"
do
  check_file "$path"
done

if command -v python3 >/dev/null 2>&1; then
  if python3 - <<'PY'
import sys
raise SystemExit(0 if sys.version_info >= (3, 10) else 1)
PY
  then
    pass "Python 3.10+ available"
  else
    fail "Python 3.10+ available"
  fi

  if python3 -m compileall -q "$APP_DIR"; then
    pass "Python syntax compileall"
  else
    fail "Python syntax compileall"
  fi
else
  fail "python3 command available"
  fail "Python syntax compileall"
fi

required_packages=(fastapi uvicorn sqlalchemy jinja2 python-multipart)
requirements_ok=1
for package in "${required_packages[@]}"; do
  if grep -Eq "^${package}([<>=!~].*)?$" "$REF_DIR/requirements.txt"; then
    :
  else
    requirements_ok=0
  fi
done

extra_package="$(grep -Ev '^[[:space:]]*(#|$)' "$REF_DIR/requirements.txt" \
  | sed -E 's/[<>=!~].*$//' \
  | grep -Ev '^(fastapi|uvicorn|sqlalchemy|jinja2|python-multipart)$' \
  | head -n 1 || true)"

if [[ "$requirements_ok" -eq 1 && -z "$extra_package" ]]; then
  pass "official dependency allowlist only"
else
  fail "official dependency allowlist only"
fi

if grep -q 'RedirectResponse' "$APP_DIR/routers/memos.py" \
  && [[ "$(grep -c 'status_code=303' "$APP_DIR/routers/memos.py")" -ge 3 ]]; then
  pass "create/update/delete PRG 303 redirects present"
else
  fail "create/update/delete PRG 303 redirects present"
fi

form_occurrences="$(grep -oF 'Form(' "$APP_DIR/routers/memos.py" | wc -l | tr -d ' ')"
if [[ "$form_occurrences" -ge 4 ]]; then
  pass "FastAPI Form() create/update inputs present"
else
  fail "FastAPI Form() create/update inputs present"
fi

if grep -q 'Depends(get_db)' "$APP_DIR/routers/memos.py"; then
  pass "Depends(get_db) session injection present"
else
  fail "Depends(get_db) session injection present"
fi

if grep -q 'sqlite:///./database.db' "$APP_DIR/database.py"; then
  pass "SQLite database configuration present"
else
  fail "SQLite database configuration present"
fi

if grep -q 'db.query' "$APP_DIR/repositories/memo_repository.py" \
  && grep -q 'db.add' "$APP_DIR/repositories/memo_repository.py" \
  && grep -q 'db.commit' "$APP_DIR/repositories/memo_repository.py" \
  && grep -q 'db.delete' "$APP_DIR/repositories/memo_repository.py"; then
  pass "Repository CRUD persistence operations present"
else
  fail "Repository CRUD persistence operations present"
fi

if grep -q 'memo.id' "$APP_DIR/templates/memos/detail.html" \
  && grep -q 'memo.title' "$APP_DIR/templates/memos/detail.html" \
  && grep -q 'memo.content' "$APP_DIR/templates/memos/detail.html" \
  && grep -q 'memo.created_at' "$APP_DIR/templates/memos/detail.html" \
  && grep -q 'memo.updated_at' "$APP_DIR/templates/memos/detail.html"; then
  pass "detail template exposes all Memo model fields"
else
  fail "detail template exposes all Memo model fields"
fi

if grep -q 'method="post"' "$APP_DIR/templates/memos/form.html" \
  && grep -q 'href="/memos/"' "$APP_DIR/templates/memos/form.html"; then
  pass "create/update form has POST and cancel navigation"
else
  fail "create/update form has POST and cancel navigation"
fi

home_link_occurrences="$(grep -oF 'href="/memos' "$APP_DIR/templates/home.html" | wc -l | tr -d ' ')"
if [[ "$home_link_occurrences" -ge 2 ]]; then
  pass "home page has at least two feature links"
else
  fail "home page has at least two feature links"
fi

if grep -q 'TemplateResponse' "$APP_DIR/routers/home.py" \
  && grep -q 'TemplateResponse' "$APP_DIR/routers/memos.py"; then
  pass "Jinja2 TemplateResponse SSR present"
else
  fail "Jinja2 TemplateResponse SSR present"
fi

printf 'Result: %d PASS / %d FAIL\n' "$PASS" "$FAIL"
[[ "$FAIL" -eq 0 ]]
