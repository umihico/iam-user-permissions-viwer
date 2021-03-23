#!/bin/bash
set -e
if [[ -z "${USERNAME}" ]]; then
  USERNAME=$(aws iam get-user --query 'User.UserName' --output text)
fi

aws iam get-user --user-name $USERNAME --output table
aws iam list-user-policies --user-name $USERNAME --output table
for POLICY_NAME in $(aws iam list-user-policies --user-name $USERNAME --query "PolicyNames" --output text) ; do
  aws iam get-user-policy --user-name $USERNAME --policy-name $POLICY_NAME --output table
done
aws iam list-attached-user-policies --user-name $USERNAME --output table
for POLICY_ARN in $(aws iam list-attached-user-policies --user-name $USERNAME --query "AttachedPolicies[].PolicyArn" --output text) ; do
  VERSION=$(aws iam get-policy --policy-arn $POLICY_ARN --output json --output text --query "Policy.DefaultVersionId")
  aws iam get-policy-version --version-id $VERSION --policy-arn $POLICY_ARN --query "PolicyVersion.Document.Statement" --output table
done

aws iam list-groups-for-user --user-name $USERNAME --output table
for GROUP in $(aws iam list-groups-for-user --user-name $USERNAME --output text --query "Groups[].GroupName") ; do
  aws iam list-group-policies --output table --group-name $GROUP --output table
  for POLICY_NAME in $(aws iam list-group-policies --output table --group-name $GROUP --query "PolicyNames" --output text) ; do
    aws iam get-group-policy --group-name $GROUP --policy-name $POLICY_NAME --output table
  done
  aws iam list-attached-group-policies --output table --group-name $GROUP;
  for POLICY_ARN in $(aws iam list-attached-group-policies --group-name $GROUP --query "AttachedPolicies[].PolicyArn" --output text) ; do
    VERSION=$(aws iam get-policy --policy-arn $POLICY_ARN --output json --output text --query "Policy.DefaultVersionId")
    aws iam get-policy-version --version-id $VERSION --policy-arn $POLICY_ARN --query "PolicyVersion.Document.Statement" --output table
  done
done
