# PowerVS Image Capture

Script to automate capturing images of [PowerVS](https://www.ibm.com/products/power-virtual-server) LPARs on [IBM Cloud](https://www.ibm.com/cloud) and storing them to [IBM Cloud Object Storage](https://www.ibm.com/ca-en/cloud/object-storage).

Main script to edit is: [powervs_image_capture.sh](https://github.com/emaadparacha/PowerVS-Image-Capture/blob/main/powervs_image_capture.sh)

Script with test key data: [powervs_image_capture_test.sh](https://github.com/emaadparacha/PowerVS-Image-Capture/blob/main/powervs_image_capture_test.sh)

### Prerequisities and Guide:

1. Install the IBM Cloud CLI: https://cloud.ibm.com/docs/cli?topic=cli-getting-started
2. Create an API key to use to sign on (this will go into the `IBM_CLOUD_API_KEY` variable in the script): https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key
