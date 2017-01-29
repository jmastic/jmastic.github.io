---
layout: post
title: Test & Target Audit Reporting
---

Adobe's A/B testing software platform, Test & Target, has an API which allows you to download reports from up to the past 4 weeks. I always want to keep a record of the tests that I have run so that I can make sure that I am constantly learning and improving my tests, so I created a Java program which will download the audit report for all of the campaigns that I have run. Let me show you how it works:

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

Now you need to just build an XML reader to loop through them and perform the steps below.

# 2. Get the campaign's current status
* optional – I'm calling this step optional because its not entirely necessary. I use the status to categorize and sort the campaigns, but you don’t need to do this.

Now from the example above, it may not be entirely obvious how to get the status of the campaign. However, the <description> tag will have this information for you, you just need to know what may be returned.

The `<description>` will hold the latest modification made to the status of the campaign, so we can use the wording of the status update to get the current status. The possible return values for a campaign `<description>` are:

* approved the campaign
* deactivated the campaign
* deactivated and archived the campaign
* archived the campaign

Finding the current status from this is now a matter of looking for the right words in the right order:

```
if (campaignStatus.indexOf("archived") >= 0) {
    /* Campaign is currently archived */
} else if (campaignStatus.indexOf("deactivated") >= 0) {
    /* Campaign is deactivated */
} else if (campaignStatus.indexOf("approved") >= 0) {
    /* Campaign is approved / running */
}
```

# 3. Download the Daily Report
There are 3 reports I download: the daily report, the weekly report, and the audit report. If you're really only concerned about one of them then go for it! I felt that these three reports together would give me the most information without being too over-the-top.

So, for the daily report for a campaign, here is the API call to use:

```
https://testandtarget.omniture.com/api?client=CLIENTID&email=YOUREMAIL&password=YOURPASSWORD&operation=report&campaignId=CAMPAIGNID&start=2010-08-01T00:00&end=TODAYSDATE
```

As before, you will need to replace `CLIENTID`, `YOUREMAIL`, and `YOURPASSWORD` with your account information.

You will also need to put in the campaignId, which you grab from the XML in Step 1, and you need to format today’s date into YYYY-MM-DDTHH:mm and put it into `TODAYSDATE`.

# 4. Download the Weekly Report
This will be exactly the same as the daily report in Step 3, but the API call will need to be modified to include a “resolution” parameter. This is actually inferred to be “resolution=day” in the API call in Step 3, but we can set this to be “week” to get a weekly report.

```
https://testandtarget.omniture.com/api?client=CLIENTID&email=YOUREMAIL&password=YOURPASSWORD&operation=report&campaignId=CAMPAIGNID&start=2010-08-01T00:00&end=TODAYSDATE
```

# 5. Download the Audit Report
This is probably the report you’re actually concerned about. This one only comes in CSV intead of XML like we’ve been doing the other reports.

A quick note about this report, if you attempt to get this data 4 months after the end of the test, you may get an error. So, if you’re automatically overwriting any files during this process, you need to make sure you actually get some results back before saving it or you may lose your information.

```
https://testandtarget.omniture.com/api?client=CLIENTID&email=YOUREMAIL&password=YOURPASSWORD&operation=auditReport&campaignId=CAMPAIGNID&start=2010-08-01T00:00&end=TODAYSDATE
```

And that’s it! These calls are pretty simple, you’ll just need to build out a simple XML reader / parser to read through the API results.

Again, you can find a wealth of information about the Test & Target API at [Omniture’s Test & Target API Developer area](https://developer.omniture.com/en_US/documentation/test-target/c-overview-7).
