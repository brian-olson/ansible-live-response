# ansible-live-response

This is a sample of Ansible playbooks to use for DFIR. The playbooks were demonstrated in a presentation by Brian Olson at SANS DFIR Summit 2019 in Austin, TX (video link tbd).

## Section 1 - Create Test Lab
1.1 Create a couple of small spot instances in AWS. Be sure to modify the variables in create-lab-aws.yml to suit your needs.

`ansible-playbook create-lab-aws.yml`

1.2 Get the newly create ec2 instances public IP addresses. You need to have your aws api keys setup as environmental variables for this to work. The bash script below has a quick one-liner to retrieve and grep out the public IP addresses from AWS.

`./get_ec2_public_ips.sh`

1.3 Put the public IP addresses from the output above into the inventory.ini file where desired.

1.4 Run the LAMP playbook to install python from the common playbook and prepare the LAMP stack.

`ansible-playbook lamp.yml`

## Section 2 - DFIR Triage
This playbook performs some basic information gathering and collects some artifacts of use during a webserver investigation.

- Running Processes
- Netstat
- Memory Dump*
- Apache Logs
- System Logs
- Bash History
- Web Server Files (webdir)

2.1 Run DFIR-triage playbook.

`ansible-playbook DFIR-triage.yml`

2.2 Review artifacts ($pwd/artifacts) retrieved and build out the response playbook.  

## Section 3 - DFIR Response
This playbook makes some changes to the host based on the findings of the triage phase.

### Phase 1
- Patch
- Reconfigure/secure services

### Phase 2

- Remove malware
- Remove unauthorized local users
- Terminate suspicious processes & network connections

3.1 Run the DFIR-response playbook to eradicate the adversary

`ansible-playbook DFIR-respond.yml`
