Adobe’s A/B testing software platform, Test & Target, has an API which allows you to download reports from up to the past 4 weeks. I always want to keep a record of the tests that I have run so that I can make sure that I am constantly learning and improving my tests, so I created a Java program which will download the audit report for all of the campaigns that I have run. Let me show you how it works:

Before we begin, let me preface this post by saying you can find information about the Test & Target API at [Omniture’s Test & Target API Developer area](https://developer.omniture.com/en_US/documentation/test-target/c-overview-7).

Now, on to your guide!

# 1. Get the list of your campaigns
First we need to get the list of campaigns in your Test & Target account. We will use this to iterate over our campaigns and get the data for each one. You can use the following API call to get the campaigns list in XML format, replacing `CLIENTID`, `YOUREMAIL`, and `YOURPASSWORD` with the appropriate information for your specific account.

```
https://testandtarget.omniture.com/api?client=CLIENTID&email=YOUREMAIL&password=YOURPASSWORD
```

You will get back some XML that will look similar to this:

```
<campaigns>
    <campaign>
        <id>1234</id>
        <name>
            Sample Experiment Name
        </name>
        <thirdPartyId/>
        <event>
            <modificationDate>2013-01-01 07:26</modificationDate>
            <modifierEmail>sample@domain.com</modifierEmail>
            <modifierName>Test User</modifierName>
            <description>archived the campaign</description>
        </event>
    </campaign>
</campaigns>
```
