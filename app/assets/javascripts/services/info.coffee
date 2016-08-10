info = ['$resource', ($resource) ->
  $resource '/api/infos/:id.json', { id: '@id' },
    index:
      method:  'GET'
      isArray: true
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.infos

    show:
      method:  'GET'
      isArray: false
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.info
   
    create:
      method:  'POST'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(info: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.info

    update:
      method:  'PUT'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(info: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.info
    
    destroy:
      method:  'DELETE'
      isArray: false
      responseType: 'json'
]

angular.module('students').factory('Info', info)
