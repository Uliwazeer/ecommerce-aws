import json
import jwt
import os

def lambda_handler(event, context):
    secret = os.environ.get("JWT_SECRET", "default_secret")
    
    # استخراج التوكن من الهيدر
    token = None
    if event.get("headers") and "Authorization" in event["headers"]:
        token = event["headers"]["Authorization"].split(" ")[1]  # Bearer <token>
    else:
        return {
            "statusCode": 401,
            "body": json.dumps({"message": "Unauthorized: No token provided"})
        }

    # محاولة فك التوكن والتحقق منه
    try:
        decoded = jwt.decode(token, secret, algorithms=["HS256"])
        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Authorized",
                "user": decoded
            })
        }
    except jwt.ExpiredSignatureError:
        return {
            "statusCode": 401,
            "body": json.dumps({"message": "Token expired"})
        }
    except jwt.InvalidTokenError:
        return {
            "statusCode": 401,
            "body": json.dumps({"message": "Invalid token"})
        }
