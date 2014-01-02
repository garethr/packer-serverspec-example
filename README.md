# Packer Serverspec Example

[![wercker
status](https://app.wercker.com/status/e0e5ae1131427238297c028dbcc2bfeb
"wercker
status")](https://app.wercker.com/project/bykey/e0e5ae1131427238297c028dbcc2bfeb)

[Packer](http://www.packer.io/) provides a great way of describing the steps
for creating a virtual machine image. But it doesn't have a built-in way
of verifying those images.

[Serverspec](http://serverspec.org/) provides a nice framework for
writing tests against infrastructure, asserting the operation of
services or the installation of packages.

This repo demonstrates a simple integration between Packer and
Serverspec, using Serverspec tests to validate the instance provisioning
before the image is created.
 

## Installation

First you need to [install
Packer](http://www.packer.io/intro/getting-started/setup.html).

Next download the Puppet modules described in the Puppetfile. For this
we're using [Bundler](http://bundler.io/) which you'll need installed.

    bundle install
    bundle exec librarian-puppet install


## Usage

Now you'll need to set a couple of Amazon environment variables:

    export AWS_ACCESS_KEY_ID=xxxx
    export AWS_SECRET_ACCESS_KEY=xxxx

And finally run Packer:

    packer build template.json

This will boot an AWS instance, install Puppet, use Puppet to install various
bits of software, then run the test suite. Only if all of that works
will it build the AMI.
