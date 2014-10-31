# Getting a free certificate

This page guides you through the process of obtaining an HTTPS certificate for your site. This is a real certificate, not a self-signed certificate, and works in all major browsers.

The CA which we'll use is StartSSL. They provide basic certificates for free, although will charge for other types, such as wildcard certificates.

## Generating a public/private keypair

A keypair can be generated with OpenSSL:

    openssl req -new -newkey rsa:2048 -sha256 -keyout example.com.key -nodes -out example.com.csr

This command will prompt you for a country name, state name etc. *All of this can be ignored*. Just hit enter to accept the defaults because StartSSL doesn't use that information.

The only value you may want to give is a passphrase to protect the private key. Keep in mind that your webserver needs the private key so, if you set a passphrase, you'll need to enter it whenever you restart the webserver.

Now that we have a key, we can get a certificate issued by the CA.

## StartSSL

StartSSL is free, but it's not the best designed website in the world. Below is a series of screenshots which will hopefully guide you through the process. Not absolutely every step has a screenshot so do the obvious thing at each step. If you need to click something then the screenshot may have a red ring around the the target.

Firstly, *use Firefox*. Seriously.

Go to [StartSSL](https://startssl.com) (it should have an EV certificate). On the frontpage, click &ldquo;Control Panel&rdquo; at the top-right to get started.

We assume that you've never used StartSSL before so need to sign up:

![StartSSL signup page](../../../raw/master/startssl/startssl-signup.png)

Enter your details:

![StartSSL account page](../../../raw/master/startssl/startssl-account.png)

You'll need to verify the email address by entering the magic value that is sent to you:

![](../../../raw/master/startssl/startssl-verify1.png)

StartSSL doesn't use passwords for accounts, it uses client-side certificates. You need to generate one and install it in your browser:

![](../../../raw/master/startssl/startssl-genkey.png)

![installing a client side certificate](../../../raw/master/startssl/startssl-clientsidecert.png)

Once your account has been setup, you'll be at your "Control Panel". First you need to prove that you control the site that you are getting a certificate for. For free certificates, this means being able to accept email for some distinguished usernames.

![StartSSL control panel page](../../../raw/master/startssl/startssl-cp.png)

You are validating a domain name.

![](../../../raw/master/startssl/startssl-valtype.png)

You must be able to receive email for one of the distinguished usernames:

![selecting an email address](../../../raw/master/startssl/startssl-selemail.png)

Wait for the email and enter the code contained in it into the textbox.

![](../../../raw/master/startssl/startssl-code2.png)

Once you have proved that you own the domain, finished the validations wizard and enter the certificate wizard.

![](../../../raw/master/startssl/startssl-valok.png)

You want an HTTPS certificate.

![selecting a certificate type](../../../raw/master/startssl/startssl-certtype.png)

Select the domain that you just validated.

![selecting domains for the certificate](../../../raw/master/startssl/startssl-seldomains.png)

I strongly recommend that you add a name for `www` to the certificate.

![](../../../raw/master/startssl/startssl-adddomains.png)

This bit is important. *Skip the private key generation.* You already generated a private key at the very beginning. We're going to give StartSSL the public key to sign and the private key should never leave your control.

![skipping private key generation](../../../raw/master/startssl/startssl-genprivkey.png)

The `openssl` command that you ran at the beginning created two files. One of them was a CSR file. You need to open this up and paste its contents into the textbox. It's a plain ASCII file so almost anything should open it.

![pasting in the CSR](../../../raw/master/startssl/startssl-csr.png)

Now we're almost done! This is your signed certificate. Paste it somewhere safe. It's not secret, but you don't want to lose it!

![getting the final certificate](../../../raw/master/startssl/startssl-savecert.png)

## Intermediate certificates

You must configure your webserver with the correct intermediate certificate in order for your certificate to work. You can download [StartSSL's intermediate CA certificate](https://www.startssl.com/certs/sub.class1.server.ca.pem).
