# iam-user-permissions-viwer

This simple bash scripts helps you to visualize each IAM user's permission detail like this.

```bash
-----------------------------------------------------------
|                         GetUser                         |
+---------------------------------------------------------+
||                         User                          ||
|+-------------+-----------------------------------------+|
||  Arn        |  arn:aws:iam::123456789012:user/s3user  ||
||  CreateDate |  2018-01-01T20:00:00+00:00              ||
||  Path       |  /                                      ||
||  UserId     |  ABCDEFGHIJKLMNOYQRSTU                  ||
||  UserName   |  s3user                                 ||
|+-------------+-----------------------------------------+|
------------------
|ListUserPolicies|
+----------------+
------------------------------------------------------------------------
|                       ListAttachedUserPolicies                       |
+----------------------------------------------------------------------+
||                          AttachedPolicies                          ||
|+---------------------------------------------+----------------------+|
||                  PolicyArn                  |     PolicyName       ||
|+---------------------------------------------+----------------------+|
||  arn:aws:iam::aws:policy/AmazonS3FullAccess |  AmazonS3FullAccess  ||
|+---------------------------------------------+----------------------+|
----------------------------------
|        GetPolicyVersion        |
+--------+----------+------------+
| Action | Effect   | Resource   |
+--------+----------+------------+
|  s3:*  |  Allow   |  *         |
+--------+----------+------------+
-------------------
|ListGroupsForUser|
+-----------------+

```

## How to

```bash
sh one.sh # shows your own permission details
USERNAME=s3user sh one.sh # you can specify USERNAME
sh all.sh # redirect all users details under created directory 'output'
```

[Japanese article here](https://qiita.com/umihico/items/fcde03200bd0d1a7ed78)
