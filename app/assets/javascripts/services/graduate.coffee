graduate = ['$resource', ($resource) ->
  $resource '/api/graduates/:id.json', { id: '@id' },
    index:
      method:  'GET'
      isArray: true
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.graduates

    show:
      method:  'GET'
      isArray: false
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.graduate
   
    create:
      method:  'POST'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(graduate: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.graduate

    update:
      method:  'PUT'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(graduate: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.graduate
    
    destroy:
      method:  'DELETE'
      isArray: false
      responseType: 'json'
]

angular.module('students').factory('Graduate', graduate)
