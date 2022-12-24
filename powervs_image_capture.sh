#!/bin/bash

### --- Variables --- ###

# IBM Cloud Defines
IBM_CLOUD_API_KEY="ENTER_YOUR_API_KEY"
REGION="ca-tor OR ENTER_YOUR_REGION"

# PowerVS defines
CRN_POWERVS_WRKSPCE="ENTER_YOUR_WORKSPACE_CRN"
LPAR_ID="ENTER_YOUR_LPAR_ID"

# Image Name defines
UNIX_TIME=$(date +%s)
IMAGE_SAVE_NAME="aix_image_$UNIX_TIME"

# COS defines
COS_BUCKET="ENTER_YOUR_COS_BUCKET_NAME"
COS_REGION="ENTER_YOUR_COS_REGION"
COS_ACCESS_KEY="ENTER_YOUR_COS_ACCESS_KEY"
COS_SECRET_KEY="ENTER_YOUR_COS_SECRET_KEY"

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
