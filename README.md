# Novu CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/novu"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Novu server with CI/CD on Elestio

<img src="novu.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Novu UI here:

    URL: https://[CI_CD_DOMAIN]
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# Custom SMTP and Novu Integration

This README provides instructions on integrating Custom SMTP and Novu with your workflow, as well as guidance on using Novu with Node.js.

## Custom SMTP Integration

To utilize the SMTP server provided for your workflow, follow these steps:

1. Navigate to the `Get Started` section and click on the `Change Provider` button under `Email`.
2. Choose `Custom SMTP` and proceed to the next step.
3. Select your environment, either `Development` or `Production`, and click `Create`.
4. Click on the `Disabled` button to activate it.
5. Update the name as desired.
6. Set the Host to `172.17.0.1` and Port to `25`.
7. Click on `Ignore TLS` to activate it.
8. Set the From email address to `[DOMAIN]@vm.elestio.app`.
9. Specify the Sender as desired.
10. Finally, click on the `Update` button to save your settings.

# Using Novu with Node.js

To integrate Novu with your Node.js project, follow these steps:

1.  Install the Novu package in your Node.js project:

        npm install @novu/node

2.  Once installed, import Novu into your application and initialize it using your Novu account credentials:

        import { Novu } from '@novu/node';

        const config = {
            backendUrl: "https://[CI_CD_DOMAIN]:6443",
        };

        const novu = new Novu('<NOVU_API_KEY>', config);

3.  Create a subscriber by adding the following code to a new file named `novu.js`:

        const { Novu } = require("@novu/node");

        const config = {
            backendUrl: "https://[CI_CD_DOMAIN]:6443",
        };

        const novu = new Novu("<NOVU_API_KEY>", config);

        const addNewSubscriber = async () => {
            const subscriberId = "7789"; // Replace this with a unique user ID that matches your database.
            await novu.subscribers.identify(subscriberId, {
                email: "abc@gmail.com", // optional
                firstName: "John", // optional
                lastName: "Doe", // optional
                phone: "", // optional
                avatar: "", // optional
                data: { customKey1: "customVal1", customKey2: "customVal2" }, // optional
            });
        };

        addNewSubscriber();

4.  Run the code in your terminal:

        node ./novu.js

This will add the subscriber to your Novu dashboard.

For further details and documentation, visit Novu <a target="_blank" href="https://docs.novu.co/quickstarts/overview">Quickstarts Overview</a>.

Additional information is available for Client-side integration with:

- Vue
- React
- Angular
- VanillaJS
- RedwoodJS
- iFrame
- NextJS

And for Server-side integration with:

- Node.js
- PHP
- Python
- Kotlin
- Ruby
- .NET
- NextJS
- Go
- Java
