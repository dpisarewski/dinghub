dinghub
=======

Relationship Types:
-------------------

is_a
instance_of
part_of

is_property_of
subclass_of


annotates
defines
uses

contributed_to
contributed

-----------

has_child
has_silbing


=============================================

http://www.clres.com/semrels/umls_relation_list.html


consists_of       constitutes
contains          contained_in
location_of       has_location
method_of         has_method
part_of           has_part
performs          performed_by
produces          produced_by
property_of       has_property
result_of         has_result
uses              used_by



(actor) [contributed]   (contribution)  [contributed_to]   (thing)

(actor) [performs]      (contribution)  [produces]         (thing)

(actor) [performs]      (statement)     [contributed_to]   (thing)
