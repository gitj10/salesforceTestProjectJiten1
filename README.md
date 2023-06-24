Project Name: Salesforce Test Exercise
Author: Jitendra Kushwaha
Date: June 24, 2023

------------------------------------------------------------------

Project Overview:

This Salesforce project aims to create a Community that leverages the Geolocation API of the browser and integrates with publicly available WeatherAPI and NewsAPI to display weather information and news articles based on the user's current location. The project utilizes Apex classes, flows, Lightning Web Components (LWCs), and Aura components to achieve the desired functionality.

Note: The initial code for LWC,Aura componets and APEX classes was generated using CHATGPT generative AI with minor modifications.
------------------------------------------------------------------

Components:

1. Community Setup
   - Name: WelcomeGuestPage
   - Type: Customer Account Portal
   - URL: https://mindful-badger-5lnaib-dev-ed.trailblaze.my.site.com/wgb
   - Public Access: YES
   - Guest or Unauthenticated User Profile: WelcomeGuestPage Profile

   Description: The Salesforce Community is configured to provide a user-friendly interface for external/guest users to access the application and view weather information and news articles based on their current location.

   There are two prospective solutions built:
   a. Home: Uses only LWCs and Apex classes to fetch the data and display it on a single page.
   b. HomeWithFlow: Uses an Aura component to initiate a screen flow to achieve the same functionality. However, this solution is not currently supported for guest users due to Salesforce limitations. Debugging the flow in system mode can verify its functionality.
      (Note: Support for guest users to access named external credentials is not yet available in Salesforce. This can be confirmed by referencing the Salesforce idea: https://ideas.salesforce.com/s/idea/a0B8W00000Ml2ygUAB/ability-for-guest-profile-to-access-named-external-credentials)

   Navigation Menu:
   - Home: Home page that embeds the LWC "LocationLwc".
   - HomeWithFlow: NewHomeWithFlow page that embeds the Aura component "auraFlowLauncher".

2. Apex Classes
   - NewsApiHelper: Contains methods "getNewsArticles" and "getWeatherData" to retrieve data from the NewsAPI and WeatherAPI respectively. It uses legacy keys stored in named credentials.
   - NewsApiHelperTest: Test class for the NewsApiHelper class.
   - MockHttpResponseGenerator: Mock class to generate test responses for HTTP callouts.
   - NewsData: Apex wrapper class to map the news article data in a flattened hierarchy. It is used as an Apex-defined variable in the flow.
   - WeatherData: Apex wrapper class to map the weather data in a flattened hierarchy. It is used as an Apex-defined variable in the flow.

3. Named Credentials (Legacy)
   - NewsAPILegacy: Stores the API authentication details for the NewsAPI.
   - WeatherAPILeagacy: Stores the API authentication details for the WeatherAPI.

   3.1 CspTrustedSite
      - Added the following URL sites as Content Security Policy Trusted Sites:
        - NewsAPI: https://newsapi.org
        - WeatherAPI: http://api.weatherapi.com
        (Note: This is required for Apex HTTP callouts and not for callouts made from the Salesforce flow)

4. Named Credentials
   - NewsAPI: Stores the API authentication details for the NewsAPI. It is used within Apex actions in the flow.
   - WeatherAPI: Stores the API authentication details for the WeatherAPI. It is used within Apex actions in the flow.

   4.1 ExternalCredential
      - NewsAPIExt: Created for storing the NewsAPI API key.
      - WeatherAPIExt: Created for storing the WeatherAPI API key.

      4.1.1 Permission Set
         - TestPermissionForAPI: Created to provide

        4.1.2 access to ExternalCredentials.
         - Permission set assigned to the WelcomeGuestPage Site Guest User and System Admin user.

5. Flows
   - Name: TestNewFlowCommunity

   Description: The flow contains two screens:
   a. Screen for Aura component "locationAura" to obtain the coordinates on the first use.
   b. Screen to display data inside the LWC "locationLwcRO".

   The flow also includes two invocable actions:
   a. getWeatherData1: Fetches weather API data and city/country names for NewsAPI input, with coordinate data as input.
   b. getNewsData: Fetches NewsAPI data.

   Additionally, the flow includes other elements for checking null inputs, processing JSON data, and limiting the number of news articles to 10.

6. Aura Components
   - auraFlowLauncher: This Aura component launches the screen flow "TestNewFlowCommunity" on load.
   - locationAura: This Aura component retrieves the user's location coordinates on button click using the Geolocation API from the browser. It prompts the user to allow location access if not already enabled in the browser settings.

7. Lightning Web Components (LWCs)
   - For Solution #1:
     - locationLwc: This LWC retrieves the user's location coordinates on button click using the Geolocation API from the browser. It prompts the user to allow location access if not already enabled in the browser settings.
     - weatherComponent: Displays weather information.
     - newsComponent: Displays a list of news articles.
     - newsCard: Displays the data of a single news article.

   - For Solution #2:
     - weatherComponentRO: Displays weather information.
     - newsComponentRO: Displays a list of news articles.
     - newsCardRO: Displays the data of a single news article, including images.

8. Profile
   - Name: WelcomeGuestPage Profile

   Access:
   - Apex Class Access: NewsApiHelper, NewsData, WeatherData
   - Flow Access: TestNewFlowCommunity
   - External Credential Principal Access: NewsAPIExt (API Key), WeatherAPIExt (API Key) (Optional: Since it's not supported yet)

------------------------------------------------------------------

Final Solution Note:
Since Solution #2 doesn't work for guest users, the recommended approach is to reuse the Apex callout within the flow instead of using the flow action (which is still in beta version in Salesforce). This would make Solution #2 similar to Solution #1. Solution #2 is only recommended if a screen flow UI experience is required; otherwise, Solution #1 is the preferred lightweight and simpler approach.

------------------------------------------------------------------
