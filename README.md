# n8n Workflow Deployment on Render

This repository contains the necessary files to deploy your n8n workflow on Render. n8n is a workflow automation tool that allows you to connect various services and automate tasks without coding.

## Repository Contents

- `Dockerfile`: Configures the n8n Docker image
- `render.yaml`: Render blueprint for automatic deployment
- `workflows/`: Directory containing your n8n workflows
  - `my-workflow-2.json`: Your workflow configuration

## Deployment Instructions

### 1. Fork this Repository

Click the "Fork" button at the top-right of this repository to create your own copy.

### 2. Deploy to Render

1. Create a [Render account](https://render.com) if you don't have one
2. From your Render dashboard, click "New" → "Blueprint"
3. Connect your GitHub account and select your forked repository
4. Render will detect the `render.yaml` file and create the service for you
5. Configure the environment variables:
   - `N8N_BASIC_AUTH_USER`: Username for n8n dashboard (create your own)
   - `N8N_BASIC_AUTH_PASSWORD`: Password for n8n dashboard (create your own)
6. Click "Apply"

### 3. Access Your n8n Instance

Once deployed, click on the service URL provided by Render to access your n8n instance.

### 4. Import Your Workflow

1. Log in to your n8n instance using the credentials you set up
2. Navigate to "Workflows" in the sidebar
3. Click "Import from File"
4. Upload the workflow JSON file (`workflows/my-workflow-2.json`) from this repository

### 5. Set Up Credentials

Your workflow requires OAuth credentials for Google services:

#### Google Sheets:
1. Open the Google Sheets node in your workflow
2. Click on "Credentials"
3. Set up new OAuth credentials for Google Sheets

#### Gmail:
1. Open the Gmail node in your workflow
2. Click on "Credentials"
3. Set up new OAuth credentials for Gmail

## Workflow Overview

The current workflow does the following:
1. Triggers manually when you click "Test workflow"
2. Sets data fields (Name, Email, Age)
3. Appends this data to a specified Google Sheet
4. Sends a notification email via Gmail

## Customizing Your Workflow

You can modify the workflow within the n8n interface after importing. Remember to update the Google Sheet ID and email addresses to match your own.

## Troubleshooting

If you encounter issues with your deployment:
- Check the Render logs for your service
- Ensure all environment variables are set correctly
- Verify that your OAuth credentials have the necessary permissions

## Maintaining Your Instance

- Render will automatically update to the latest n8n version if you're using the latest tag
- Back up your workflows regularly by exporting them from the n8n interface
- Monitor your Render dashboard for any service interruptions