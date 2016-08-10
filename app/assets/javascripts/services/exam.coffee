exam = ['$resource', ($resource) ->
  $resource '/api/exams/:id.json', { id: '@id' },
    index:
      method:  'GET'
      isArray: true
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.exams

    show:
      method:  'GET'
      isArray: false
      responseType: 'json'
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data?.exam
   
    create:
      method:  'POST'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(exam: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.exam

    update:
      method:  'PUT'
      isArray: false
      responseType: 'json'
      transformRequest: (data) ->
        angular.toJson(exam: data)
      transformResponse: (data, headersGetter) ->
        if (typeof data == 'string')
          data = JSON.parse(data)
        data.errors || data.exam
    
    destroy:
      method:  'DELETE'
      isArray: false
      responseType: 'json'
]

angular.module('students').factory('Exam', exam)
