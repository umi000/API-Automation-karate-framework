function fn() {
var urlValue = ''
if (karate.env == 'prod') {
    urlValue='https://api.qlu.ai/api/v2/'
  }
else if(karate.env == 'stage')
    {
        urlValue = 'https://staging.api.qlu.ai/'
    }
  var config = {
    apienv: karate.env ,
    apiBaseURL : urlValue
  }

  config.reader = karate.callSingle('classpath:features/common/DataReader.feature');
  return config;
}