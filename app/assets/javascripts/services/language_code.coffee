language_code = ['$resource', ($resource) ->
  $resource '/api/language_codes/:id.json', { id: '@id' },
    index:
      method:  'GET'
      isArray: true
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.language_codes

    show:
      method:  'GET'
      isArray: false
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.language_code
   
    create:
      method:  'POST'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(language_code: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.language_code

    update:
      method:  'PUT'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(language_code: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.language_code
    
    destroy:
      method:  'DELETE'
      isArray: false
      responseType: 'json'
]

angular.module('students').factory('LanguageCode', language_code)
