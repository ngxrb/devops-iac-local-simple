#!/bin/bash

# Namespaces where resources exist
namespaces=("local-dev" "local-pre" "local-prod")

# Terraform module paths
modules=("module.rbac_dev" "module.rbac_pre" "module.rbac_prod")

# Import Roles and RoleBindings for each namespace
for i in "${!namespaces[@]}"; do
  namespace="${namespaces[$i]}"
  module="${modules[$i]}"

  echo "Importing resources for namespace: $namespace"

  # Import Roles
  roles=$(kubectl get roles -n $namespace -o jsonpath='{.items[*].metadata.name}')
  for role in $roles; do
    echo "Importing role: $role"
    terraform import $module.kubernetes_role.role $namespace/$role
  done

  # Import RoleBindings
  role_bindings=$(kubectl get rolebindings -n $namespace -o jsonpath='{.items[*].metadata.name}')
  for role_binding in $role_bindings; do
    echo "Importing rolebinding: $role_binding"
    terraform import $module.kubernetes_role_binding.binding $namespace/$role_binding
  done
done

# Optionally, import namespaces as well if necessary
echo "Importing namespaces"
namespaces_to_import=("local-devops" "local-dev" "local-pre" "local-prod")
for ns in "${namespaces_to_import[@]}"; do
  echo "Importing namespace: $ns"
  terraform import module.namespace.kubernetes_namespace.namespace $ns
done

echo "Import complete."
