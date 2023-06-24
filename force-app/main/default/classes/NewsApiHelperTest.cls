@isTest
public class NewsApiHelperTest {
    @isTest
    public static void testGetNewsArticles() {

        String searchTerm = 'Auckland, New Zealand';
		String fromDate = '2023-06-20';

        String testBody ='{"status":"ok","totalResults":8,"articles":[{"source":{"id":null,"name":"Www.vg.no"},"author":"Synne Sofie Christiansen, Mattis Sandblad (foto)","title":"Legende om Norges sjanser i VM: – Landslagstroen min er litt drept","description":"ULLEVAAL (VG) OL-vinner og fotballekspert Solveig Gulbrandsen er ærlig på hva hun mener om Norges muligheter i VM.","url":"https://www.vg.no/sport/fotball/i/76o5b8/solveig-gulbrandsen-om-norges-fotballandslag-sine-sjanser-i-vm-i-new-zealand","urlToImage":"https://akamai.vgc.no/v2/images/7c4ea54a-3f22-423b-851f-967fe26b21df?fit=crop&format=auto&h=1267&w=1900&s=9c4a6ebcf43796c603bff115e878460a0ed649d2","publishedAt":"2023-06-22T00:32:21Z","content":"KLAR I TALEN: Solveig Gulbrandsen erkjenner at Norges kvinnefotballandslag har en lang vei å gå før de igjen lever opp til forventningene satt da hun var landslagsspiller. Foto: Terje Pedersen / NTB\r… [+4576 chars]"},{"source":{"id":null,"name":"Marketscreener.com"},"author":"Reuters","title":"DIARY-Top Economic Events to Aug. 18","description":"(marketscreener.com) 1000 GMT\n FRANKFURT - ECB board member Frank Elderson speaks about climate issues - 1600 GMT\n ATLANTA - Federal Reserve Bank of Atlanta President Raphael Bostic participates in conversation\non relevant topics to the finance community and …","url":"https://www.marketscreener.com/quote/currency/US-DOLLAR-EURO-USD-EUR-90101/news/DIARY-Top-Economic-Events-to-Aug-18-44162329/","urlToImage":"https://www.marketscreener.com/images/twitter_MS_fdnoir.png","publishedAt":"2023-06-22T00:01:01Z","content":"June 22 (Reuters) -\r\nFor other diaries, please see:\r\nTop Economic Events\r\nEmerging Markets Economic Events\r\nGovernment Debt Auctions\r\nPolitical and General News\r\nU.S. Federal Reserve\r\nToday in Washin… [+10263 chars]"}]}';

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(200, 'OK',testBody));
        
        String result = NewsApiHelper.getNewsArticles(searchTerm, fromDate);

        System.assertEquals(testBody, result);
    }
    
    @isTest
    public static void testGetWeatherData() {

        String latitude = '-36.87,174.77';
		String longitude = '-41.3,174.78';

        String testBody ='{"location":{"name":"Auckland","region":"","country":"New Zealand","lat":-36.87,"lon":174.77,"tz_id":"Pacific/Auckland","localtime_epoch":1687490542,"localtime":"2023-06-23 15:22"},"current":{"last_updated_epoch":1687490100,"last_updated":"2023-06-23 15:15","temp_c":17.0,"temp_f":62.6,"is_day":1,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png","code":1003},"wind_mph":6.9,"wind_kph":11.2,"wind_degree":100,"wind_dir":"E","pressure_mb":1006.0,"pressure_in":29.71,"precip_mm":0.6,"precip_in":0.02,"humidity":77,"cloud":75,"feelslike_c":17.0,"feelslike_f":62.6,"vis_km":10.0,"vis_miles":6.0,"uv":4.0,"gust_mph":16.3,"gust_kph":26.3}}';

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(200, 'OK',testBody));
        String result = NewsApiHelper.getWeatherData(latitude, longitude);

        System.assertEquals(testBody, result);
    }
}