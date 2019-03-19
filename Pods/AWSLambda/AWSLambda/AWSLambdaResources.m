//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSLambdaResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLambdaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLambdaResources

+ (instancetype)sharedInstance {
    static AWSLambdaResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLambdaResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-03-31\",\
    \"endpointPrefix\":\"lambda\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS Lambda\",\
    \"serviceId\":\"Lambda\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"lambda-2015-03-31\"\
  },\
  \"operations\":{\
    \"AddPermission\":{\
      \"name\":\"AddPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"AddPermissionRequest\"},\
      \"output\":{\"shape\":\"AddPermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"PolicyLengthExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Adds a permission to the resource policy associated with the specified AWS Lambda function. You use resource policies to grant permissions to event sources that use the <i>push</i> model. In a <i>push</i> model, event sources (such as Amazon S3 and custom applications) invoke your Lambda function. Each permission you add to the resource policy allows an event source permission to invoke the Lambda function. </p> <p>Permissions apply to the Amazon Resource Name (ARN) used to invoke the function, which can be unqualified (the unpublished version of the function), or include a version or alias. If a client uses a version or alias to invoke a function, use the <code>Qualifier</code> parameter to apply permissions to that ARN. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>\"\
    },\
    \"CreateAlias\":{\
      \"name\":\"CreateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Creates an alias that points to the specified Lambda function version. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>Alias names are unique for a given function. This requires permission for the lambda:CreateAlias action.</p>\"\
    },\
    \"CreateEventSourceMapping\":{\
      \"name\":\"CreateEventSourceMapping\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"CreateEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Identifies a poll-based event source for a Lambda function. It can be either an Amazon Kinesis or DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the event source.</p> <p>This association between a poll-based source and a Lambda function is called the event source mapping.</p> <p>You provide mapping information (for example, which stream or SQS queue to read from and which Lambda function to invoke) in the request body.</p> <p>Amazon Kinesis or DynamoDB stream event sources can be associated with multiple AWS Lambda functions and a given Lambda function can be associated with multiple AWS event sources. For Amazon SQS, you can configure multiple queues as event sources for a single Lambda function, but an SQS queue can be mapped only to a single Lambda function.</p> <p>You can configure an SQS queue in an account separate from your Lambda function's account. Also the queue needs to reside in the same AWS region as your function. </p> <p>If you are using versioning, you can specify a specific function version or an alias via the function name parameter. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>\"\
    },\
    \"CreateFunction\":{\
      \"name\":\"CreateFunction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateFunctionRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Lambda function. The function configuration is created from the request parameters, and the code for the function is provided by a .zip file. The function name is case-sensitive.</p> <p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>\"\
    },\
    \"DeleteAlias\":{\
      \"name\":\"DeleteAlias\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Lambda function alias. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the lambda:DeleteAlias action.</p>\"\
    },\
    \"DeleteEventSourceMapping\":{\
      \"name\":\"DeleteEventSourceMapping\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"DeleteEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p> <p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>\"\
    },\
    \"DeleteFunction\":{\
      \"name\":\"DeleteFunction\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Lambda function. To delete a specific function version, use the <code>Qualifier</code> parameter. Otherwise, all versions and aliases are deleted. Event source mappings are not deleted.</p> <p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>\"\
    },\
    \"DeleteFunctionConcurrency\":{\
      \"name\":\"DeleteFunctionConcurrency\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2017-10-31/functions/{FunctionName}/concurrency\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionConcurrencyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Removes concurrent execution limits from this function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">Managing Concurrency</a>.</p>\"\
    },\
    \"GetAccountSettings\":{\
      \"name\":\"GetAccountSettings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2016-08-19/account-settings/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetAccountSettingsRequest\"},\
      \"output\":{\"shape\":\"GetAccountSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves details about your account's <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">limits</a> and usage in a region.</p>\"\
    },\
    \"GetAlias\":{\
      \"name\":\"GetAlias\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns the specified alias information such as the alias ARN, description, and function version it is pointing to. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the <code>lambda:GetAlias</code> action.</p>\"\
    },\
    \"GetEventSourceMapping\":{\
      \"name\":\"GetEventSourceMapping\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p> <p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>\"\
    },\
    \"GetFunction\":{\
      \"name\":\"GetFunction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionRequest\"},\
      \"output\":{\"shape\":\"GetFunctionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p> <p>Use the <code>Qualifier</code> parameter to retrieve a published version of the function. Otherwise, returns the unpublished version (<code>$LATEST</code>). For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>\"\
    },\
    \"GetFunctionConfiguration\":{\
      \"name\":\"GetFunctionConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionConfigurationRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p> <p>If you are using the versioning feature, you can retrieve this information for a specific function version by using the optional <code>Qualifier</code> parameter and specifying the function version or alias that points to it. If you don't provide it, the API returns information about the $LATEST version of the function. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>\"\
    },\
    \"GetPolicy\":{\
      \"name\":\"GetPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetPolicyRequest\"},\
      \"output\":{\"shape\":\"GetPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the resource policy associated with the specified Lambda function.</p> <p>This action requires permission for the <code>lambda:GetPolicy action.</code> </p>\"\
    },\
    \"Invoke\":{\
      \"name\":\"Invoke\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/invocations\"\
      },\
      \"input\":{\"shape\":\"InvocationRequest\"},\
      \"output\":{\"shape\":\"InvocationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestContentException\"},\
        {\"shape\":\"RequestTooLargeException\"},\
        {\"shape\":\"UnsupportedMediaTypeException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"EC2UnexpectedException\"},\
        {\"shape\":\"SubnetIPAddressLimitReachedException\"},\
        {\"shape\":\"ENILimitReachedException\"},\
        {\"shape\":\"EC2ThrottledException\"},\
        {\"shape\":\"EC2AccessDeniedException\"},\
        {\"shape\":\"InvalidSubnetIDException\"},\
        {\"shape\":\"InvalidSecurityGroupIDException\"},\
        {\"shape\":\"InvalidZipFileException\"},\
        {\"shape\":\"KMSDisabledException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"KMSAccessDeniedException\"},\
        {\"shape\":\"KMSNotFoundException\"},\
        {\"shape\":\"InvalidRuntimeException\"}\
      ],\
      \"documentation\":\"<p>Invokes a Lambda function. For an example, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/with-dynamodb-create-function.html#with-dbb-invoke-manually\\\">Create the Lambda Function and Test It Manually</a>. </p> <p>Specify just a function name to invoke the latest version of the function. To invoke a published version, use the <code>Qualifier</code> parameter to specify a <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">version or alias</a>.</p> <p>If you use the <code>RequestResponse</code> (synchronous) invocation option, the function will be invoked only once. If you use the <code>Event</code> (asynchronous) invocation option, the function will be invoked at least once in response to an event and the function must be idempotent to handle this.</p> <p>For functions with a long timeout, your client may be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings.</p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p> <p>The <code>TooManyRequestsException</code> noted below will return the following: <code>ConcurrentInvocationLimitExceeded</code> will be returned if you have no functions with reserved concurrency and have exceeded your account concurrent limit or if a function without reserved concurrency exceeds the account's unreserved concurrency limit. <code>ReservedFunctionConcurrentInvocationLimitExceeded</code> will be returned when a function with reserved concurrency exceeds its configured concurrency limit. </p>\"\
    },\
    \"InvokeAsync\":{\
      \"name\":\"InvokeAsync\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2014-11-13/functions/{FunctionName}/invoke-async/\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"InvokeAsyncRequest\"},\
      \"output\":{\"shape\":\"InvokeAsyncResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestContentException\"},\
        {\"shape\":\"InvalidRuntimeException\"}\
      ],\
      \"documentation\":\"<important> <p>For asynchronous function invocation, use <a>Invoke</a>.</p> </important> <p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch Logs console.</p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\",\
      \"deprecated\":true\
    },\
    \"ListAliases\":{\
      \"name\":\"ListAliases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListAliasesRequest\"},\
      \"output\":{\"shape\":\"ListAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns list of aliases created for a Lambda function. For each alias, the response includes information such as the alias ARN, description, alias name, and the function version to which it points. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the lambda:ListAliases action.</p>\"\
    },\
    \"ListEventSourceMappings\":{\
      \"name\":\"ListEventSourceMappings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListEventSourceMappingsRequest\"},\
      \"output\":{\"shape\":\"ListEventSourceMappingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>). </p> <p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p> <p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>\"\
    },\
    \"ListFunctions\":{\
      \"name\":\"ListFunctions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListFunctionsRequest\"},\
      \"output\":{\"shape\":\"ListFunctionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p> <p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p> <p>If you are using the versioning feature, you can list all of your functions or only <code>$LATEST</code> versions. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p>\"\
    },\
    \"ListTags\":{\
      \"name\":\"ListTags\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2017-03-31/tags/{ARN}\"\
      },\
      \"input\":{\"shape\":\"ListTagsRequest\"},\
      \"output\":{\"shape\":\"ListTagsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of tags assigned to a function when supplied the function ARN (Amazon Resource Name). For more information on Tagging, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\"\
    },\
    \"ListVersionsByFunction\":{\
      \"name\":\"ListVersionsByFunction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListVersionsByFunctionRequest\"},\
      \"output\":{\"shape\":\"ListVersionsByFunctionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Lists all versions of a function. For information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p>\"\
    },\
    \"PublishVersion\":{\
      \"name\":\"PublishVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"PublishVersionRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Publishes a version of your function from the current snapshot of $LATEST. That is, AWS Lambda takes a snapshot of the function code and configuration information from $LATEST and publishes a new version. The code and configuration cannot be modified after publication. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p>\"\
    },\
    \"PutFunctionConcurrency\":{\
      \"name\":\"PutFunctionConcurrency\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2017-10-31/functions/{FunctionName}/concurrency\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutFunctionConcurrencyRequest\"},\
      \"output\":{\"shape\":\"Concurrency\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Sets a limit on the number of concurrent executions available to this function. It is a subset of your account's total concurrent execution limit per region. Note that Lambda automatically reserves a buffer of 100 concurrent executions for functions without any reserved concurrency limit. This means if your account limit is 1000, you have a total of 900 available to allocate to individual functions. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">Managing Concurrency</a>.</p>\"\
    },\
    \"RemovePermission\":{\
      \"name\":\"RemovePermission\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy/{StatementId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"RemovePermissionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Removes permissions from a function. You can remove individual permissions from an resource policy associated with a Lambda function by providing a statement ID that you provided when you added the permission. When you remove permissions, disable the event source mapping or trigger configuration first to avoid errors.</p> <p>Permissions apply to the Amazon Resource Name (ARN) used to invoke the function, which can be unqualified (the unpublished version of the function), or include a version or alias. If a client uses a version or alias to invoke a function, use the <code>Qualifier</code> parameter to apply permissions to that ARN. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>You need permission for the <code>lambda:RemovePermission</code> action.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2017-03-31/tags/{ARN}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Creates a list of tags (key-value pairs) on the Lambda function. Requires the Lambda function ARN (Amazon Resource Name). If a key is specified without a value, Lambda creates a tag with the specified key and a value of null. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>. </p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2017-03-31/tags/{ARN}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Removes tags from a Lambda function. Requires the function ARN (Amazon Resource Name). For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>. </p>\"\
    },\
    \"UpdateAlias\":{\
      \"name\":\"UpdateAlias\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Using this API you can update the function version to which the alias points and the alias description. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the lambda:UpdateAlias action.</p>\"\
    },\
    \"UpdateEventSourceMapping\":{\
      \"name\":\"UpdateEventSourceMapping\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"UpdateEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping.</p> <p>If you disable the event source mapping, AWS Lambda stops polling. If you enable again, it will resume polling from the time it had stopped polling, so you don't lose processing of any records. However, if you delete event source mapping and create it again, it will reset.</p> <p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>\"\
    },\
    \"UpdateFunctionCode\":{\
      \"name\":\"UpdateFunctionCode\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/code\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionCodeRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration.</p> <p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>\"\
    },\
    \"UpdateFunctionConfiguration\":{\
      \"name\":\"UpdateFunctionConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionConfigurationRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code.</p> <p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccountLimit\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TotalCodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>Maximum size, in bytes, of a code package you can upload per region. The default size is 75 GB. </p>\"\
        },\
        \"CodeSizeUnzipped\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>Size, in bytes, of code/dependencies that you can zip into a deployment package (uncompressed zip/jar size) for uploading. The default limit is 250 MB.</p>\"\
        },\
        \"CodeSizeZipped\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>Size, in bytes, of a single zipped code/dependencies package you can upload for your Lambda function(.zip/.jar file). Try using Amazon S3 for uploading larger files. Default limit is 50 MB.</p>\"\
        },\
        \"ConcurrentExecutions\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Number of simultaneous executions of your function per region. The default limit is 1000.</p>\"\
        },\
        \"UnreservedConcurrentExecutions\":{\
          \"shape\":\"UnreservedConcurrentExecutions\",\
          \"documentation\":\"<p>The number of concurrent executions available to functions that do not have concurrency limits set. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">Managing Concurrency</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides limits of code size and concurrency associated with the current account and region. For more information or to request a limit increase for concurrent executions, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Lambda Limits</a>. </p>\"\
    },\
    \"AccountUsage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TotalCodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>Total size, in bytes, of the account's deployment packages per region.</p>\"\
        },\
        \"FunctionCount\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of your account's existing functions per region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides code size usage and function count associated with the current account and region.</p>\"\
    },\
    \"Action\":{\
      \"type\":\"string\",\
      \"pattern\":\"(lambda:[*]|lambda:[a-zA-Z]+|[*])\"\
    },\
    \"AddPermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"StatementId\",\
        \"Action\",\
        \"Principal\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"StatementId\":{\
          \"shape\":\"StatementId\",\
          \"documentation\":\"<p>A unique statement identifier.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"Action\",\
          \"documentation\":\"<p>The AWS Lambda action you want to allow in this statement. Each Lambda action is a string starting with <code>lambda:</code> followed by the API name . For example, <code>lambda:CreateFunction</code>. You can use wildcard (<code>lambda:*</code>) to grant permission for all AWS Lambda actions. </p>\"\
        },\
        \"Principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal who is getting this permission. The principal can be an AWS service (e.g. <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>) for service triggers, or an account ID for cross-account access. If you specify a service as a principal, use the <code>SourceArn</code> parameter to limit who can invoke the function through that service.</p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name of the invoker. </p> <important> <p>If you add a permission to a service principal without providing the source ARN, any AWS account that creates a mapping to your function ARN can invoke your Lambda function.</p> </important>\"\
        },\
        \"SourceAccount\":{\
          \"shape\":\"SourceOwner\",\
          \"documentation\":\"<p>This parameter is used for S3 and SES. The AWS account ID (without a hyphen) of the source owner. For example, if the <code>SourceArn</code> identifies a bucket, then this is the bucket owner's account ID. You can use this additional condition to ensure the bucket you specify is owned by a specific account (it is possible the bucket owner deleted the bucket and some other AWS account created the bucket). You can also use this condition to specify all sources (that is, you don't specify the <code>SourceArn</code>) owned by a specific account. </p>\"\
        },\
        \"EventSourceToken\":{\
          \"shape\":\"EventSourceToken\",\
          \"documentation\":\"<p>A unique token that must be supplied by the principal invoking the function. This is currently only used for Alexa Smart Home functions.</p>\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to add permissions to a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a> </p>\"\
        }\
      }\
    },\
    \"AddPermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Statement\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The permission statement you specified in the request. The response returns the same as a string using a backslash (\\\"\\\\\\\") as an escape character in the JSON.</p>\"\
        }\
      }\
    },\
    \"AdditionalVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[0-9]+\"\
    },\
    \"AdditionalVersionWeights\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AdditionalVersion\"},\
      \"value\":{\"shape\":\"Weight\"}\
    },\
    \"Alias\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(?!^[0-9]+$)([a-zA-Z0-9-_]+)\"\
    },\
    \"AliasConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>Lambda function ARN that is qualified using the alias name as the suffix. For example, if you create an alias called <code>BETA</code> that points to a helloworld function version, the ARN is <code>arn:aws:lambda:aws-regions:acct-id:function:helloworld:BETA</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Alias name.</p>\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Function version to which the alias points.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Alias description.</p>\"\
        },\
        \"RoutingConfig\":{\
          \"shape\":\"AliasRoutingConfiguration\",\
          \"documentation\":\"<p>Specifies an additional function versions the alias points to, allowing you to dictate what percentage of traffic will invoke each version.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Represents the latest updated revision of the function or alias.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration information about a Lambda function version alias.</p>\"\
    },\
    \"AliasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasConfiguration\"}\
    },\
    \"AliasRoutingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdditionalVersionWeights\":{\
          \"shape\":\"AdditionalVersionWeights\",\
          \"documentation\":\"<p>The name of the second alias, and the percentage of traffic that is routed to it.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The alias's <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html\\\">traffic shifting</a> configuration.</p>\"\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\\\-])+:([a-z]{2}(-gov)?-[a-z]+-\\\\d{1})?:(\\\\d{12})?:(.*)\"\
    },\
    \"BatchSize\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"Blob\":{\
      \"type\":\"blob\",\
      \"sensitive\":true\
    },\
    \"BlobStream\":{\
      \"type\":\"blob\",\
      \"streaming\":true\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CodeStorageExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Concurrency\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedConcurrentExecutions\":{\
          \"shape\":\"ReservedConcurrentExecutions\",\
          \"documentation\":\"<p>The number of concurrent executions reserved for this function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">Managing Concurrency</a>.</p>\"\
        }\
      }\
    },\
    \"CreateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\",\
        \"FunctionVersion\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Name for the alias you are creating.</p>\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Lambda function version for which you are creating the alias.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Description of the alias.</p>\"\
        },\
        \"RoutingConfig\":{\
          \"shape\":\"AliasRoutingConfiguration\",\
          \"documentation\":\"<p>Specifies an additional version your alias can point to, allowing you to dictate what percentage of traffic will invoke each version. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html\\\">Traffic Shifting Using Aliases</a>.</p>\"\
        }\
      }\
    },\
    \"CreateEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EventSourceArn\",\
        \"FunctionName\"\
      ],\
      \"members\":{\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the event source.</p>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Set to false to disable the event source upon creation. </p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records. The default for Amazon Kinesis and Amazon DynamoDB is 100 records. Both the default and maximum for Amazon SQS are 10 messages.</p>\"\
        },\
        \"StartingPosition\":{\
          \"shape\":\"EventSourcePosition\",\
          \"documentation\":\"<p>The position in the DynamoDB or Kinesis stream where AWS Lambda should start reading. For more information, see <a href=\\\"http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType\\\">GetShardIterator</a> in the <i>Amazon Kinesis API Reference Guide</i> or <a href=\\\"http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_streams_GetShardIterator.html\\\">GetShardIterator</a> in the <i>Amazon DynamoDB API Reference Guide</i>. The <code>AT_TIMESTAMP</code> value is supported only for <a href=\\\"http://docs.aws.amazon.com/streams/latest/dev/amazon-kinesis-streams.html\\\">Kinesis streams</a>. </p>\"\
        },\
        \"StartingPositionTimestamp\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The timestamp of the data record from which to start reading. Used with <a href=\\\"http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType\\\">shard iterator type</a> AT_TIMESTAMP. If a record with this exact timestamp does not exist, the iterator returned is for the next (later) record. If the timestamp is older than the current trim horizon, the iterator returned is for the oldest untrimmed data record (TRIM_HORIZON). Valid only for <a href=\\\"http://docs.aws.amazon.com/streams/latest/dev/amazon-kinesis-streams.html\\\">Kinesis streams</a>. </p>\"\
        }\
      }\
    },\
    \"CreateFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Runtime\",\
        \"Role\",\
        \"Handler\",\
        \"Code\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The runtime version for the function.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function's <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role\\\">execution role</a>.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The name of the method within your code that Lambda calls to execute your function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html\\\">Programming Model</a>.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"FunctionCode\",\
          \"documentation\":\"<p>The code for the function.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the function.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The amount of time that Lambda allows a function to run before terminating it. The default is 3 seconds. The maximum allowed value is 900 seconds.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of memory that your function has access to. Increasing the function's memory also increases it's CPU allocation. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\"\
        },\
        \"Publish\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to true to publish the first version of the function during creation.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>If your Lambda function accesses resources in a VPC, you provide this parameter identifying the list of security group IDs and subnet IDs. These must belong to the same VPC. You must provide at least one security group and one subnet ID.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"DeadLetterConfig\",\
          \"documentation\":\"<p>A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/dlq.html\\\">Dead Letter Queues</a>. </p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"Environment\",\
          \"documentation\":\"<p>Environment variables that are accessible from function code during execution.</p>\"\
        },\
        \"KMSKeyArn\":{\
          \"shape\":\"KMSKeyArn\",\
          \"documentation\":\"<p>The ARN of the KMS key used to encrypt your function's environment variables. If not provided, AWS Lambda will use a default service key.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"TracingConfig\",\
          \"documentation\":\"<p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with AWS X-Ray.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of tags (key-value pairs) assigned to the new function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\"\
        }\
      }\
    },\
    \"Date\":{\"type\":\"timestamp\"},\
    \"DeadLetterConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/dlq.html\\\">dead letter queue</a> for failed asynchronous invocations.</p>\"\
    },\
    \"DeleteAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Name of the alias to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        }\
      }\
    },\
    \"DeleteEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The event source mapping ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        }\
      }\
    },\
    \"DeleteFunctionConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        }\
      }\
    },\
    \"DeleteFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version to delete. You cannot delete a version that is referenced by an alias.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"EC2AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Need additional permissions to configure VPC settings.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EC2ThrottledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda was throttled by Amazon EC2 during Lambda function initialization using the execution role provided for the Lambda function.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EC2UnexpectedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"},\
        \"EC2ErrorCode\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda received an unexpected EC2 client exception while setting up for the Lambda function.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"ENILimitReachedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda was not able to create an Elastic Network Interface (ENI) in the VPC, specified as part of Lambda function configuration, because the limit for network interfaces has been reached.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"Enabled\":{\"type\":\"boolean\"},\
    \"Environment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Variables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p>Environment variable key-value pairs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A function's environment variable settings.</p>\"\
    },\
    \"EnvironmentError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"SensitiveString\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error messages for environment variables that could not be applied.</p>\"\
    },\
    \"EnvironmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Variables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p>Environment variable key-value pairs.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"EnvironmentError\",\
          \"documentation\":\"<p>Error messages for environment variables that could not be applied.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The results of a configuration update that applied environment variables.</p>\"\
    },\
    \"EnvironmentVariableName\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-zA-Z]([a-zA-Z0-9_])+\",\
      \"sensitive\":true\
    },\
    \"EnvironmentVariableValue\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"EnvironmentVariables\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EnvironmentVariableName\"},\
      \"value\":{\"shape\":\"EnvironmentVariableValue\"},\
      \"sensitive\":true\
    },\
    \"EventSourceMappingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS Lambda assigned opaque identifier for the mapping.</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>\"\
        },\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis or DynamoDB stream that is the source of events.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the poll-based source.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The UTC time string indicating the last time the event mapping was updated.</p>\"\
        },\
        \"LastProcessingResult\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The result of the last AWS Lambda invocation of your Lambda function. This value will be null if an SQS queue is the event source.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The state of the event source mapping. It can be <code>Creating</code>, <code>Enabled</code>, <code>Disabled</code>, <code>Enabling</code>, <code>Disabling</code>, <code>Updating</code>, or <code>Deleting</code>.</p>\"\
        },\
        \"StateTransitionReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason the event source mapping is in its current state. It is either user-requested or an AWS Lambda-initiated state transition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes mapping between an Amazon Kinesis or DynamoDB stream and a Lambda function.</p>\"\
    },\
    \"EventSourceMappingsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventSourceMappingConfiguration\"}\
    },\
    \"EventSourcePosition\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRIM_HORIZON\",\
        \"LATEST\",\
        \"AT_TIMESTAMP\"\
      ]\
    },\
    \"EventSourceToken\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[a-zA-Z0-9._\\\\-]+\"\
    },\
    \"FunctionArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"FunctionCode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The base64-encoded contents of your zip file containing your deployment package. AWS SDK and AWS CLI clients handle the encoding for you.</p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>An Amazon S3 bucket in the same region as your function.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 key of the deployment package.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>For versioned objects, the version of the deployment package object to use.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The code for the Lambda function. You can specify either an S3 location, or upload a deployment package directly.</p>\"\
    },\
    \"FunctionCodeLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The repository from which you can download the function.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The presigned URL you can use to download the function's .zip file that you previously uploaded. The URL is valid for up to 10 minutes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The object for the Lambda function location.</p>\"\
    },\
    \"FunctionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the function.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"NameSpacedFunctionArn\",\
          \"documentation\":\"<p>The function's Amazon Resource Name.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The runtime environment for the Lambda function.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The function's execution role.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The function Lambda calls to begin executing your function.</p>\"\
        },\
        \"CodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the function's deployment package in bytes.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The function's description.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The amount of time that Lambda allows a function to run before terminating it.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The memory allocated to the function</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the function was last updated, in <a href=\\\"https://www.w3.org/TR/NOTE-datetime\\\">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ssTZD).</p>\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The SHA256 hash of the function's deployment package.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the Lambda function.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfigResponse\",\
          \"documentation\":\"<p>The function's networking configuration.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"DeadLetterConfig\",\
          \"documentation\":\"<p>The function's dead letter queue.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"EnvironmentResponse\",\
          \"documentation\":\"<p>The function's environment variables.</p>\"\
        },\
        \"KMSKeyArn\":{\
          \"shape\":\"KMSKeyArn\",\
          \"documentation\":\"<p>The KMS key used to encrypt the function's environment variables. Only returned if you've configured a customer managed CMK.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"TracingConfigResponse\",\
          \"documentation\":\"<p>The function's AWS X-Ray tracing configuration.</p>\"\
        },\
        \"MasterArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN of the master function.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Represents the latest updated revision of the function or alias.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A Lambda function's configuration settings.</p>\"\
    },\
    \"FunctionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionConfiguration\"}\
    },\
    \"FunctionName\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"FunctionVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\"ALL\"]\
    },\
    \"GetAccountSettingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetAccountSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountLimit\":{\
          \"shape\":\"AccountLimit\",\
          \"documentation\":\"<p>Limits related to concurrency and code storage.</p>\"\
        },\
        \"AccountUsage\":{\
          \"shape\":\"AccountUsage\",\
          \"documentation\":\"<p>The number of functions and amount of storage in use.</p>\"\
        }\
      }\
    },\
    \"GetAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Name of the alias for which you want to retrieve information.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        }\
      }\
    },\
    \"GetEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS Lambda assigned ID of the event source mapping.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        }\
      }\
    },\
    \"GetFunctionConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to get details about a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to get details about a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Configuration\":{\
          \"shape\":\"FunctionConfiguration\",\
          \"documentation\":\"<p>The function's configuration.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"FunctionCodeLocation\",\
          \"documentation\":\"<p>The function's code.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Returns the list of tags associated with the function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\"\
        },\
        \"Concurrency\":{\
          \"shape\":\"Concurrency\",\
          \"documentation\":\"<p>The concurrent execution limit set for this function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">Managing Concurrency</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This response contains the object for the Lambda function location (see <a>FunctionCodeLocation</a>.</p>\"\
    },\
    \"GetPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>You can specify this optional query parameter to specify a function version or an alias name in which case this API will return all permissions associated with the specific qualified ARN. If you don't provide this parameter, the API will return permissions that apply to the unqualified function ARN.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource policy associated with the specified function. The response returns the same as a string using a backslash (\\\"\\\\\\\") as an escape character in the JSON.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Represents the latest updated revision of the function or alias.</p>\"\
        }\
      }\
    },\
    \"Handler\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[^\\\\s]+\"\
    },\
    \"HttpStatus\":{\"type\":\"integer\"},\
    \"Integer\":{\"type\":\"integer\"},\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRequestContentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRuntimeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The runtime or runtime version specified is not supported.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidSecurityGroupIDException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Security Group ID provided in the Lambda function VPC configuration is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidSubnetIDException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Subnet ID provided in the Lambda function VPC configuration is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidZipFileException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda could not unzip the deployment package.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvocationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"InvocationType\":{\
          \"shape\":\"InvocationType\",\
          \"documentation\":\"<p>Choose from the following options.</p> <ul> <li> <p> <code>RequestResponse</code> (default) - Invoke the function synchronously. Keep the connection open until the function returns a response or times out.</p> </li> <li> <p> <code>Event</code> - Invoke the function asynchronously. Send events that fail multiple times to the function's dead-letter queue (if configured).</p> </li> <li> <p> <code>DryRun</code> - Validate parameter values and verify that the user or role has permission to invoke the function.</p> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Invocation-Type\"\
        },\
        \"LogType\":{\
          \"shape\":\"LogType\",\
          \"documentation\":\"<p>You can set this optional parameter to <code>Tail</code> in the request only if you specify the <code>InvocationType</code> parameter with value <code>RequestResponse</code>. In this case, AWS Lambda returns the base64-encoded last 4 KB of log data produced by your Lambda function in the <code>x-amz-log-result</code> header. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Log-Type\"\
        },\
        \"ClientContext\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Using the <code>ClientContext</code> you can pass client-specific information to the Lambda function you are invoking. You can then process the client information in your Lambda function as you choose through the context variable. For an example of a <code>ClientContext</code> JSON, see <a href=\\\"http://docs.aws.amazon.com/mobileanalytics/latest/ug/PutEvents.html\\\">PutEvents</a> in the <i>Amazon Mobile Analytics API Reference and User Guide</i>.</p> <p>The ClientContext JSON must be base64-encoded and has a maximum size of 3583 bytes.</p> <note> <p> <code>ClientContext</code> information is returned only if you use the synchronous (<code>RequestResponse</code>) invocation type.</p> </note>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Client-Context\"\
        },\
        \"Payload\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to invoke a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      },\
      \"payload\":\"Payload\"\
    },\
    \"InvocationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The HTTP status code will be in the 200 range for successful request. For the <code>RequestResponse</code> invocation type this status code will be 200. For the <code>Event</code> invocation type this status code will be 202. For the <code>DryRun</code> invocation type the status code will be 204. </p>\",\
          \"location\":\"statusCode\"\
        },\
        \"FunctionError\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Indicates whether an error occurred while executing the Lambda function. If an error occurred this field will have one of two values; <code>Handled</code> or <code>Unhandled</code>. <code>Handled</code> errors are errors that are reported by the function while the <code>Unhandled</code> errors are those detected and reported by AWS Lambda. Unhandled errors include out of memory errors and function timeouts. For information about how to report an <code>Handled</code> error, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/programming-model.html\\\">Programming Model</a>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Function-Error\"\
        },\
        \"LogResult\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> It is the base64-encoded logs for the Lambda function invocation. This is present only if the invocation type is <code>RequestResponse</code> and the logs were requested. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Log-Result\"\
        },\
        \"Payload\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p> It is the JSON representation of the object returned by the Lambda function. This is present only if the invocation type is <code>RequestResponse</code>. </p> <p>In the event of a function error this field contains a message describing the error. For the <code>Handled</code> errors the Lambda function will report this message. For <code>Unhandled</code> errors AWS Lambda reports the message. </p>\"\
        },\
        \"ExecutedVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The function version that has been executed. This value is returned only if the invocation type is <code>RequestResponse</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html\\\">Traffic Shifting Using Aliases</a>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Executed-Version\"\
        }\
      },\
      \"documentation\":\"<p>Upon success, returns an empty response. Otherwise, throws an exception.</p>\",\
      \"payload\":\"Payload\"\
    },\
    \"InvocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Event\",\
        \"RequestResponse\",\
        \"DryRun\"\
      ]\
    },\
    \"InvokeAsyncRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"InvokeArgs\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"InvokeArgs\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"payload\":\"InvokeArgs\"\
    },\
    \"InvokeAsyncResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"HttpStatus\",\
          \"documentation\":\"<p>It will be 202 upon success.</p>\",\
          \"location\":\"statusCode\"\
        }\
      },\
      \"documentation\":\"<p>Upon success, it returns empty response. Otherwise, throws an exception.</p>\",\
      \"deprecated\":true\
    },\
    \"KMSAccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because KMS access was denied. Check the Lambda function's KMS permissions.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"KMSDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because the KMS key used is disabled. Check the Lambda function's KMS key settings.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"KMSInvalidStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because the KMS key used is in an invalid state for Decrypt. Check the function's KMS key settings.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"KMSKeyArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()\"\
    },\
    \"KMSNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because the KMS key was not found. Check the function's KMS key settings. </p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"ListAliasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>If you specify this optional parameter, the API returns only the aliases that are pointing to the specific Lambda function version, otherwise the API returns all of the aliases created for the Lambda function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionVersion\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListAliases</code> operation. If present, indicates where to continue the listing.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of aliases to return in response. This parameter value must be greater than 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more aliases.</p>\"\
        },\
        \"Aliases\":{\
          \"shape\":\"AliasList\",\
          \"documentation\":\"<p>A list of aliases.</p>\"\
        }\
      }\
    },\
    \"ListEventSourceMappingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis or DynamoDB stream. (This parameter is optional.)</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"EventSourceArn\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListEventSourceMappings</code> operation. If present, specifies to continue the list from where the returning call left off. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of event sources to return in response. This value must be greater than 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListEventSourceMappingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more event source mappings.</p>\"\
        },\
        \"EventSourceMappings\":{\
          \"shape\":\"EventSourceMappingsList\",\
          \"documentation\":\"<p>An array of <code>EventSourceMappingConfiguration</code> objects.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a list of event sources (see <a>EventSourceMappingConfiguration</a>)</p>\"\
    },\
    \"ListFunctionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MasterRegion\":{\
          \"shape\":\"MasterRegion\",\
          \"documentation\":\"<p>Specify a region (e.g. <code>us-east-2</code>) to only list functions that were created in that region, or <code>ALL</code> to include functions replicated from any region. If specified, you also must specify the <code>FunctionVersion</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MasterRegion\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"FunctionVersion\",\
          \"documentation\":\"<p>Set to <code>ALL</code> to list all published versions. If not specified, only the latest unpublished version ARN is returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionVersion\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListFunctions</code> operation. If present, indicates where to continue the listing. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of AWS Lambda functions to return in response. This parameter value must be greater than 0. The absolute maximum of AWS Lambda functions that can be returned is 50.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListFunctionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more functions.</p>\"\
        },\
        \"Functions\":{\
          \"shape\":\"FunctionList\",\
          \"documentation\":\"<p>A list of Lambda functions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of Lambda functions.</p>\"\
    },\
    \"ListTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Resource\"],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ARN\"\
        }\
      }\
    },\
    \"ListTagsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of tags assigned to the function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\"\
        }\
      }\
    },\
    \"ListVersionsByFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> Optional string. An opaque pagination token returned from a previous <code>ListVersionsByFunction</code> operation. If present, indicates where to continue the listing. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of AWS Lambda function versions to return in response. This parameter value must be greater than 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListVersionsByFunctionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more function versions.</p>\"\
        },\
        \"Versions\":{\
          \"shape\":\"FunctionList\",\
          \"documentation\":\"<p>A list of Lambda function versions.</p>\"\
        }\
      }\
    },\
    \"LogType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Tail\"\
      ]\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MasterRegion\":{\
      \"type\":\"string\",\
      \"pattern\":\"ALL|[a-z]{2}(-gov)?-[a-z]+-\\\\d{1}\"\
    },\
    \"MaxListItems\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"MemorySize\":{\
      \"type\":\"integer\",\
      \"max\":3008,\
      \"min\":128\
    },\
    \"NameSpacedFunctionArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_\\\\.]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"NamespacedFunctionName\":{\
      \"type\":\"string\",\
      \"max\":170,\
      \"min\":1,\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_\\\\.]+)(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"NamespacedStatementId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"([a-zA-Z0-9-_.]+)\"\
    },\
    \"PolicyLengthExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda function access policy is limited to 20 KB.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"PreconditionFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The RevisionId provided does not match the latest RevisionId for the Lambda function or alias. Call the <code>GetFunction</code> or the <code>GetAlias</code> API to retrieve the latest RevisionId for your resource.</p>\",\
      \"error\":{\"httpStatusCode\":412},\
      \"exception\":true\
    },\
    \"Principal\":{\
      \"type\":\"string\",\
      \"pattern\":\".*\"\
    },\
    \"PublishVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The SHA256 hash of the deployment package you want to publish. This provides validation on the code you are publishing. If you provide this parameter, the value must match the SHA256 of the $LATEST version for the publication to succeed. You can use the <b>DryRun</b> parameter of <a>UpdateFunctionCode</a> to verify the hash value that will be returned before publishing your new version.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description for the version you are publishing. If not provided, AWS Lambda copies the description from the $LATEST version.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>\"\
        }\
      }\
    },\
    \"PutFunctionConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"ReservedConcurrentExecutions\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"ReservedConcurrentExecutions\":{\
          \"shape\":\"ReservedConcurrentExecutions\",\
          \"documentation\":\"<p>The concurrent execution limit reserved for this function.</p>\"\
        }\
      }\
    },\
    \"Qualifier\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(|[a-zA-Z0-9$_-]+)\"\
    },\
    \"RemovePermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"StatementId\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"StatementId\":{\
          \"shape\":\"NamespacedStatementId\",\
          \"documentation\":\"<p>Statement ID of the permission to remove.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"StatementId\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to remove permissions from a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RevisionId\"\
        }\
      }\
    },\
    \"RequestTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request payload exceeded the <code>Invoke</code> request body JSON input limit. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a>. </p>\",\
      \"error\":{\"httpStatusCode\":413},\
      \"exception\":true\
    },\
    \"ReservedConcurrentExecutions\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()\"\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The operation conflicts with the resource's availability. For example, you attempted to update an EventSoure Mapping in CREATING, or tried to delete a EventSoure mapping currently in the UPDATING state. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\"\
    },\
    \"Runtime\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"nodejs\",\
        \"nodejs4.3\",\
        \"nodejs6.10\",\
        \"nodejs8.10\",\
        \"java8\",\
        \"python2.7\",\
        \"python3.6\",\
        \"dotnetcore1.0\",\
        \"dotnetcore2.0\",\
        \"dotnetcore2.1\",\
        \"nodejs4.3-edge\",\
        \"go1.x\"\
      ]\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":3,\
      \"pattern\":\"^[0-9A-Za-z\\\\.\\\\-_]*(?<!\\\\.)$\"\
    },\
    \"S3Key\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5\
    },\
    \"SensitiveString\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"ServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"SourceOwner\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d{12}\"\
    },\
    \"StatementId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"([a-zA-Z0-9-_]+)\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SubnetIPAddressLimitReachedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda was not able to set up VPC access for the Lambda function because one or more configured subnets has no available IP addresses.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Resource\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the Lambda function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ARN\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of tags (key-value pairs) you are assigning to the Lambda function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"Tags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"}\
    },\
    \"ThrottleReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ConcurrentInvocationLimitExceeded\",\
        \"FunctionInvocationRateLimitExceeded\",\
        \"ReservedFunctionConcurrentInvocationLimitExceeded\",\
        \"ReservedFunctionInvocationRateLimitExceeded\",\
        \"CallerRateLimitExceeded\"\
      ]\
    },\
    \"Timeout\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Timestamp\":{\"type\":\"string\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"retryAfterSeconds\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The number of seconds the caller should wait before retrying.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Retry-After\"\
        },\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"},\
        \"Reason\":{\"shape\":\"ThrottleReason\"}\
      },\
      \"documentation\":\"<p>Request throughput limit exceeded</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"TracingConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"TracingMode\",\
          \"documentation\":\"<p>The tracing mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The function's AWS X-Ray tracing configuration.</p>\"\
    },\
    \"TracingConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"TracingMode\",\
          \"documentation\":\"<p>The tracing mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The function's AWS X-Ray tracing configuration.</p>\"\
    },\
    \"TracingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Active\",\
        \"PassThrough\"\
      ]\
    },\
    \"UnreservedConcurrentExecutions\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"UnsupportedMediaTypeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The content type of the <code>Invoke</code> request body is not JSON.</p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Resource\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ARN\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The list of tag keys to be deleted from the function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UpdateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The alias name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Using this parameter you can change the Lambda function version to which the alias points.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>You can change the description of the alias using this parameter.</p>\"\
        },\
        \"RoutingConfig\":{\
          \"shape\":\"AliasRoutingConfiguration\",\
          \"documentation\":\"<p>Specifies an additional version your alias can point to, allowing you to dictate what percentage of traffic will invoke each version. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html\\\">Traffic Shifting Using Aliases</a>.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The event source mapping identifier.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether AWS Lambda should actively poll the stream or not. If disabled, AWS Lambda will not poll the stream.</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>\"\
        }\
      }\
    },\
    \"UpdateFunctionCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The contents of your zip file containing your deployment package. If you are using the web API directly, the contents of the zip file must be base64-encoded. If you are using the AWS SDKs or the AWS CLI, the SDKs or CLI will do the encoding for you. For more information about creating a .zip file, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role.html\\\">Execution Permissions</a>. </p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS Region where you are creating the Lambda function.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\"\
        },\
        \"Publish\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This boolean parameter can be used to request AWS Lambda to update the Lambda function and publish a version as an atomic operation.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This boolean parameter can be used to test your request to AWS Lambda to update the Lambda function and publish a version as an atomic operation. It will do all necessary computation and validation of your code but will not upload it or a publish a version. Each time this operation is invoked, the <code>CodeSha256</code> hash value of the provided code will also be computed and returned in the response.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either using using either <a>GetFunction</a> or <a>GetAlias</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateFunctionConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda will assume when it executes your function.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The function that Lambda calls to begin executing your function. For Node.js, it is the <code>module-name.export</code> value in your function. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A short user-defined function description. AWS Lambda does not use this value. Assign a meaningful description as you see fit.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The amount of time that Lambda allows a function to run before terminating it. The default is 3 seconds. The maximum allowed value is 900 seconds.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. AWS Lambda uses this memory size to infer the amount of CPU allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Specify security groups and subnets in a VPC to which your Lambda function needs access.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"Environment\",\
          \"documentation\":\"<p>The parent object that contains your environment's configuration settings.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The runtime version for the function.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"DeadLetterConfig\",\
          \"documentation\":\"<p>A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/dlq.html\\\">Dead Letter Queues</a>.</p>\"\
        },\
        \"KMSKeyArn\":{\
          \"shape\":\"KMSKeyArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key used to encrypt your function's environment variables. If you elect to use the AWS Lambda default service key, pass in an empty string (\\\"\\\") for this parameter.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"TracingConfig\",\
          \"documentation\":\"<p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with AWS X-Ray.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional value you can use to ensure you are updating the latest update of the function version or alias. If the <code>RevisionID</code> you pass doesn't match the latest <code>RevisionId</code> of the function or alias, it will fail with an error message, advising you to retrieve the latest function version or alias <code>RevisionID</code> using either <a>GetFunction</a> or <a>GetAlias</a>.</p>\"\
        }\
      }\
    },\
    \"Version\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"(\\\\$LATEST|[0-9]+)\"\
    },\
    \"VpcConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>A list of VPC subnet IDs.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of VPC security groups IDs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC security groups and subnets attached to a Lambda function.</p>\"\
    },\
    \"VpcConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>A list of VPC subnet IDs.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of VPC security groups IDs.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC security groups and subnets attached to a Lambda function.</p>\"\
    },\
    \"VpcId\":{\"type\":\"string\"},\
    \"Weight\":{\
      \"type\":\"double\",\
      \"max\":1.0,\
      \"min\":0.0\
    }\
  },\
  \"documentation\":\"<fullname>AWS Lambda</fullname> <p> <b>Overview</b> </p> <p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/welcome.html\\\">What is AWS Lambda</a>, and for information about how the service works, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <b>AWS Lambda Developer Guide</b>.</p>\"\
}\
";
}

@end
