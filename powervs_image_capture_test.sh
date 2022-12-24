#!/bin/bash

### --- Variables --- ###

# IBM Cloud Defines
IBM_CLOUD_API_KEY="donotusethiscloudapikeyv5bm8pWRx8n3Hw8iAkr2k"
REGION="ca-tor"

# PowerVS defines
CRN_POWERVS_WRKSPCE="crn:v1:bluemix:public:power-iaas:tor01:a/donotusethiscrn549de11:donotuse-56ef-477f-b7f2-donotuseb0a1::"
LPAR_ID="donotuse-this-lpar-id-3e7c44669c2e"

# Image Name defines
UNIX_TIME=$(date +%s)
IMAGE_SAVE_NAME="aix_image_$UNIX_TIME"

# COS defines
COS_BUCKET="sample-bucket-1"
COS_REGION="ca-tor"
COS_ACCESS_KEY="donotusethisaccesskeya2a6ff060ad16336"
COS_SECRET_KEY="donotusethissecretkey0f20ce5600b39eb367ac58d669"

### --- Commands --- ###

# Login to IBM Cloud
LOGIN_CMD="ibmcloud login --apikey $IBM_CLOUD_API_KEY -r $REGION"

# Set service target for PowerVS to workspace
SET_TARGET_CMD="ibmcloud pi service-target $CRN_POWERVS_WRKSPCE"

# Capture image of AIX LPAR and save to cloud object storage
CAPTURE_IMAGE_CMD="ibmcloud pi instance-capture $LPAR_ID --destination cloud-storage --name $IMAGE_SAVE_NAME --access-key $COS_ACCESS_KEY --secret-key $COS_SECRET_KEY --region $COS_REGION --image-path $COS_BUCKET"

# Combine commands
COMPLETE_CMD="$LOGIN_CMD && $SET_TARGET_CMD && $CAPTURE_IMAGE_CMD"

### --- Run --- ###

echo "Creating image of LPAR $LPAR_ID and saving to bucket $COS_BUCKET with name $IMAGE_SAVE_NAME"
eval $COMPLETE_CMD
