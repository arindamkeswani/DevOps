> Prerequisites:
1. AWS Account
2. AWS Access Keys
3. Knowledge of EC2 instances

> Steps:
1. Terraform overview | Launch EC2 Instance
    - Create a file: "main.tf"
    - Define a "provider", which is a plug-in that allows us to interact with APIs. Learn more about the list of providers available [here](https://registry.terraform.io/browse/providers).
    - Go to the link in the previous line and select AWS, which is what we will be working with.
    - Check out the example code in th docs, which is what you will find in `main.tf` as well.
    - Now, set-up authentication
        - The wrong way: hard-code the AWS Access keys in the `provider` section. You may try this for the experiment but be sure that you do not committ your code to a public repository. We will follow this for now.
        - The correct way: Make a `terraform.tfvars` file.
    - Time to provision some resources
        - Syntax:
            ```
                resource "<provider>_<resource_type>" "name"{
                    key = "value1"
                    key2= "value2"
                    ...
                }
            ```
        - The "name" is not set in AWS. It is used for reference in terraform.
        - Launch an EC2 instance. Refer to (this link)[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance] for syntax.
        - AMI used for this activity: ![](2022-03-09-18-26-23.png)
        - Copy the AMI ID from your AWS account and paste it in the syntax as shown in `main.tf` file
        - Next, open the terminal in your current directory and run `terraform init`, which will look at our config in the `.tf` files and look for providers and download the necessary plugins.

        ![](2022-03-09-18-42-08.png)

        - Run `terraform plan`, which reads/compares the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date. Otherwise it shows the changes needed to get to the desired infrastructure. It should show the following at the end of your output:
        ![](2022-03-09-18-52-22.png)

        - To actually run the code, run `terraform apply`. Enter yes when prompted
        ![](2022-03-09-18-54-24.png)

        The launch should be complete. Go to your AWS Console to confirm this.
        ![](2022-03-09-18-55-19.png)
        ![](2022-03-09-18-55-39.png)

        - If you would run `terraform plan` and `terraform apply` again, it will detect that there is no difference in the required configuration
        ![](2022-03-10-10-37-53.png)

        - Try changing the "Name" tag and run `terraform plan` `terraform apply` again. You do not need to run `plan`, but it is considered good practice. After doing so, check EC2 console to see if the change has been made.

        - ![](2022-03-10-10-43-55.png)
