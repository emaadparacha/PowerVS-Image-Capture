# PowerVS Image Capture

Script to automate capturing images of [PowerVS](https://www.ibm.com/products/power-virtual-server) LPARs on [IBM Cloud](https://www.ibm.com/cloud) and storing them to [IBM Cloud Object Storage](https://www.ibm.com/ca-en/cloud/object-storage). Each image name has the current unix time appended to the name to ensure uniqueness in object names.

Main script to edit is: [powervs_image_capture.sh](https://github.com/emaadparacha/PowerVS-Image-Capture/blob/main/powervs_image_capture.sh)

Script with test key data: [powervs_image_capture_test.sh](https://github.com/emaadparacha/PowerVS-Image-Capture/blob/main/powervs_image_capture_test.sh)

### Prerequisities and Guide:

1. Install the IBM Cloud CLI: https://cloud.ibm.com/docs/cli?topic=cli-getting-started
2. Create an API key to use to sign on (this will go into the `IBM_CLOUD_API_KEY` variable in the script): https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key
3. Download and install the Power IaaS plugin for IBM Cloud CLI: https://cloud.ibm.com/docs/power-iaas-cli-plugin?topic=power-iaas-cli-plugin-power-iaas-cli-reference#power-iaas-cli-before
4. Use `ibmcloud pi service-list` to get the list of PowerVS workspaces and copy the correct one's CRN. This will go into the `CRN_POWERVS_WRKSPCE` variable in the script
5. `ibmcloud pi service-target {CRN}` sets the target to that Power workspace. This is already in the script
6. Use `ibmcloud pi instances` to list the instances and their IDs. Copy the ID of the LPAR that you want to create the image for. This will go into the `LPAR_ID` variable
7. Go to Cloud Object Storage and create a bucket. Then once the bucket is created, go to "Service Credentials" on the left side menu, click "Create New Credentials", name the credentials what you want, but keep in mind to click "Advanced Options" and select HMAC "On". You will get a JSON output that you can copy the Access Key and Secret from, and input that along with the bucket name (you can also add a folder after the bucket name if you wish) and bucket region to the script in the COS defines section: https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-uhc-hmac-credentials-main
8. `ibmcloud pi instance-capture` is used to take an image and store it in COS. Again this is already in the script, but if you wish to check out the CLI doc, it is here: https://cloud.ibm.com/docs/power-iaas-cli-plugin?topic=power-iaas-cli-plugin-power-iaas-cli-reference#ibmcloud-pi-instance-capture

### Further Help
* IBM Cloud CLI Docs: https://cloud.ibm.com/docs/cli
* IBM Cloud PowerVS Docs: https://cloud.ibm.com/docs/power-iaas
* IBM Cloud Power IaaS CLI Docs: https://cloud.ibm.com/docs/power-iaas-cli-plugin
* IBM Cloud Object Storage Docs: https://cloud.ibm.com/docs/cloud-object-storage

