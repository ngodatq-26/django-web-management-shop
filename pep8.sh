#!/usr/bin/env bash

echo "Running autopep..."
find C:\Users\ngoqu\PycharmProjects\ShopManagementWeb\shop -type f -name '*.py' -exec autopep8 --in-place --aggressive --aggressive '{}' \;
echo "autopep finished."