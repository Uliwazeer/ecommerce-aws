resource "aws_lambda_function" "auth_lambda" {
  function_name = "${var.project_name}-auth"
  handler       = "handler.lambda_handler"           # اسم الملف بدون .py
  runtime       = "python3.11"
  role          = aws_iam_role.lambda_exec_role.arn
  filename      = "${path.module}/lambda_auth_payload.zip"   # المسار الصحيح للملف المضغوط

  source_code_hash = filebase64sha256("${path.module}/lambda_auth_payload.zip")

  timeout = 10

  environment {
    variables = {
      JWT_SECRET = var.jwt_secret
    }
  }
}
