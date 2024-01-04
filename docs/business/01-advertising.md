# Advertising

Let't get some basic numbers to understand how we could monetize machine learning models using advertising.

## Typical costs

### Cost per mille (CPM)

> Cost per mille, also called cost per thousand, is a commonly-used measurement in advertising. It is the cost an advertiser pays for one thousand views or impressions of an advertisement.

https://dashthis.com/kpi-examples/cost-per-thousand/

> the average online advertising cost per thousand impressions an advertiser pays would be around \$3-\$10

ChatGPT also says that it is in the range of \$1-10. This applies both to a website and to a Youtube video.

### Cost per click (CPC)

https://www.webfx.com/ppc/glossary/what-is-cpc/

> The average cost for a Google Ads CPC campaign is \$1 to \$2. If you’re advertising on the Google Display Network, the average CPC is less than \$1.

This has sense, the cost per click is lower than the cost per mille because not all the people that see the ad will click on it. In fact it implies that the click through rate (CTR) is around than 0.1%.

### Advertising on Smartphones

https://www.myhoardings.com/ads/how-much-does-it-cost-to-advertise-on-a-mobile-app/

> 1. The average U.S. rewarded videos’ CPMs is around \$15 for iOS and \$11 for Android
> 2. The average CPM for banner all Android devices is \$0,4 and \$0.5 for iOS
> 3. The average CPM for full-screen ads \$ 9.50 for IOS and around 6\$ for Android.

### Summary

| monetization      | cost ($) |
|-------------------|----------|
| Cost per mille    | 3-10     |
| Cost per click    | 1-2      |
| Rewarded video    | 11-15    |
| Smartphone banner | 0.4-0.5  |
| Full-screen add   | 6-9.5    |

## Sample case

Let's imagine we are running an API on a Nvidia T4 GPU. The prize on HuggingFace is \$0.60 per hour. Let's consider the worst scenario for each of the previous types of monetization. (I have removed the cost per click because it should be equivalent to the cost per mille).

| monetization      | lower cost ($) | upper cost ($) | hourly min visitors | monthly min visitors | max inference time (s) |
|-------------------|----------------|----------------|---------------------|----------------------|------------------------|
| Smartphone banner | 0.4            | 0.5            | 1500                | 1.1E+06              | 2.4                    |
| Cost per mille    | 3              | 10             | 200                 | 1.4E+05              | 18                     |
| Rewarded video    | 11             | 15             | 55                  | 3.9E+04              | 66                     |
| Full-screen add   | 6              | 9.5            | 100                 | 7.2E+04              | 36                     |

So to have a profitable business we will need more than 1M visitors if using an app with banners. In the other hand using rewarded videos we will need less than 40K visitors. One interesting option would be to display the
video when the image is being generated.

This monetization could be combined with a subscription model to remove the ads.
