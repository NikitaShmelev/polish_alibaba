
# JOuery ->
#     $('#person_state_id').parent().hide() 
#     states = $('#person_state_id').html() 
#     $('#person_country_id').change ->
#         country = $('#person_country_id :selected').text()
#         options = $(states).filter("optgroup[label='#{country}']").html()
#         if options
#             $('#person_state_id').html(options)
#             $('#person_state_id').parent().show()
#         else
#             $('#person_state_id').empty()
#             $('#person_state_id').parent().hide()