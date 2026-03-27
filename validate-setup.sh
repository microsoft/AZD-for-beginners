#!/usr/bin/env bash

errors=0
warnings=0

ok() {
  printf '[OK] %s\n' "$1"
}

warn() {
  printf '[WARN] %s\n' "$1"
}

fail() {
  printf '[ERROR] %s\n' "$1"
}

echo "AZD beginner setup validation"
echo

if command -v azd >/dev/null 2>&1; then
  ok "Azure Developer CLI installed: $(azd version 2>/dev/null)"
else
  fail "Azure Developer CLI not found. Install it before starting Chapter 1."
  errors=$((errors + 1))
fi

if command -v git >/dev/null 2>&1; then
  ok "Git installed: $(git --version 2>/dev/null)"
else
  fail "Git not found. Install it from https://git-scm.com/downloads"
  errors=$((errors + 1))
fi

if command -v az >/dev/null 2>&1; then
  if account_name=$(az account show --query name -o tsv 2>/dev/null); then
    ok "Azure CLI installed and authenticated: ${account_name}"
  else
    warn "Azure CLI installed, but not signed in. Run: az login only if you plan to use az commands in this course."
    warnings=$((warnings + 1))
  fi
else
  warn "Azure CLI not found. Install it only if you plan to run az commands in the course."
  warnings=$((warnings + 1))
fi

if command -v node >/dev/null 2>&1; then
  ok "Node.js installed: $(node --version 2>/dev/null)"
else
  warn "Node.js not found. The Chapter 1 todo template requires Node.js."
  warnings=$((warnings + 1))
fi

echo
echo "Summary"

if [ "$errors" -eq 0 ] && [ "$warnings" -eq 0 ]; then
  echo "Your machine is ready for the beginner path."
elif [ "$errors" -eq 0 ]; then
  echo "Required tools are present for the AZD beginner path. Review warnings before starting template-specific or Azure CLI-based exercises."
else
  echo "Install the missing required tools above before starting Chapter 1. Warnings are optional for the AZD-only beginner path."
fi

exit "$errors"