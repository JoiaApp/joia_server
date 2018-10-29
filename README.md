## Joia Rails Server

### Deploying
1.  Install EB Client https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html
2.  Commit your changes to master, then push your changes
3.  `$ eb deploy` (Note the current .elasticbeanstalk configuration)

#### Deploy Hooks

Note that currently Joia backend uses a sqlite database which is a file on the server.  Therefore, between deploys, it needs to be preserved.  There are two scripts (one to preserve before deploy & one to restore after deploy).  They are located at:

`$ eb ssh`
`[ec2-user@ip-172-31-42-75 ~] $ cat /opt/elasticbeanstalk/hooks/appdeploy/pre/13_db_copy.sh`
`[ec2-user@ip-172-31-42-75 ~] $ cat /opt/elasticbeanstalk/hooks/appdeploy/post/02_restore_db.sh`

The app is located at `/var/app/current`

### Running Rake Tasks

For example to seed the database

1.  `$ eb ssh`
2.  `[ec2-user@ip-172-31-42-75 ~] $ cd /var/app/current`
3.  `[ec2-user@ip-172-31-42-75 ~] $ sudo su`
4.  `[root@ip-172-31-42-75 current] # bundle exec rake joia:seed_prompts`

### Admin Backend

http://sample-env.qd8vv2zefd.us-west-2.elasticbeanstalk.com/users

Basic Auth username and password (`BASIC_AUTH_USER`, `BASIC_AUTH_PW`) be configured with environment variables (See Mandrill sectionbelow)

### Elastic Beanstalk Backend

https://us-west-2.console.aws.amazon.com/elasticbeanstalk/home?region=us-west-2#/applications

### Mandrill

For Mandrill to work, you will need to set the Mandrill API Key (`MANDRILL_KEY`) in the app configuration (Under Joia-Prod > Click on Sample-env app > Configuration > Software “Modify”

https://us-west-2.console.aws.amazon.com/elasticbeanstalk/home?region=us-west-2#/environment/configuration?applicationName=Joia-Prod&environmentId=e-2kdy2pmknj



### Testing Matrix
1. Landing Controller
   1. When not logged in (currentUser not set), should show the Landing View
      1. When “Sign In” pressed, should go to Sign In Controller
      2. When “Register” pressed, should go to JoinOrCreate Controller
   2. If currentUser set, should fetch groups
      1.  If current group is found in groups, go to Compose Controller
      2. If no group set, or current group not found among user’s groups, set the current group to first one in groups and go to Compose Controller
2. Register Controller
   1. “Back” button should go back
   2. “Join a Group” should go to Join Controller
   3. “Create a Group” should go to Create Group Controller
3. Join Group Controller
   1. If you enter the wrong code, or group that is missing, it should show an error message
   2. If you enter the correct code, it should take you to Join Controller
4. Register Controller
   1.  Should show error message if email is taken
   2.  Should go to Read Controller if register succeeds
5. Create Group Controller
   1. Should allow you to create a group
   2. “Back” button should go back
6. Invites Controller
   1. Should be able to skip and go straight to Read Controller
   2. Should send invites to invitees (space delimited)
   3. Skip should change to Continue if invites were sent
7. Sign in Controller
   1. Submit should be disable until email and password are entered
   2. Forgot password should be disabled until email is entered
      1. If click on forgot but email not found, should show error
      2. If click on forgot and email is valid, should show alert and email should be sent
   3. Should show error message if email and/or password are incorrect
   4. Click on “Back” should go back to Landing Controller
   5. On successful login should go to ReadController
8. Read Controller
   1. Should show thread for the group
9. Write Controller Zero State
   1. Click on Next should go to Write Controller
10. Write Controller
    1. Click on Next should go to Write Controller again with next prompt
    2. Next should be disabled until they write a long enough response
    3. Click on “Select Prompt” should allow user to change prompt
    4. Click on “Mention +” should allow you to select:
       1. Peer
       2. Contact
       3. Email address
    5. Should be able to remove tag from mention list
11. Preview controller
    1. Should show your responses
    2. Click on publish should
      1. Publish responses
      2. Return to Read Controller
      3. Should send invites
      4. Should save mentions
12. Groups Controller
    1. Should show user’s current groups
    2. Should allow you to change current group
13. Settings Controller
    1. Should allow you to go to “Profile”, “Group Settings”, “Terms & Conditions”, “Logout”
    2. Logout should log you out
14. Profile Controller
    1. Should allow you to change your display name
    2. Should allow you to change your profile picture
    3. Should allow you to change your password
    4. Should allow you to update your birthday
15. Group Settings Controller
    1. Should allow you to update group name
    2. Should allow you to send an invite
    3. Should show the group id
16. Terms and Conditions
    1. Should show terms & conditions
