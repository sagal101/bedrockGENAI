import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

# Configuration
source_bucket_name = 'test-cicd1'
destination_bucket_name = 'test-cicd2'
region = 'us-east-1'

try:
    # Create an S3 resource
    s3 = boto3.resource('s3', region_name=region)
    
    # Reference to the source and destination buckets
    source_bucket = s3.Bucket(source_bucket_name)
    destination_bucket = s3.Bucket(destination_bucket_name)
    
    # List and copy objects
    for obj in source_bucket.objects.all():
        copy_source = {
            'Bucket': source_bucket.name,
            'Key': obj.key
        }
        destination_bucket.copy(copy_source, obj.key)
        print(f'Copied {obj.key} from {source_bucket.name} to {destination_bucket.name}')
    
    print("All objects copied successfully.")
except NoCredentialsError:
    print("Credentials not available.")
except PartialCredentialsError:
    print("Incomplete credentials provided.")
except Exception as e:
    print(f"An error occurred: {e}")
