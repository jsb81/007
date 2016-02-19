<?php /*

#?ini charset="utf-8"?

[AvailableFactories]
Identifiers[]
Identifiers[]=progetti
Identifiers[]=comunicati

[progetti]
#ClassName=YourCustomPHPClass (the custom factory must extends OCEditorialStuffPostFactory)
ClassIdentifier=progetto
CreationRepositoryNode=3354
CreationButtonText=Crea nuovo progetto
RepositoryNodes[]
RepositoryNodes[]=3354
AttributeIdentifiers[]
#AttributeIdentifiers[images]=images
#AttributeIdentifiers[videos]=video
#AttributeIdentifiers[audios]=audio
#AttributeIdentifiers[tags]=argomento
StateGroup=progetti
States[draft]=Bozza
States[pending]=In attesa di pubblicazione
States[published]=Pubblicato
Actions[]
Actions[draft-pending]=NotifyGroup;3358
Actions[pending-draft]=NotifyOwner
Actions[pending-published]=AddLocation;994|NotifyOwner

[comunicati]
#ClassName=YourCustomPHPClass (the custom factory must extends OCEditorialStuffPostFactory)
ClassIdentifier=progetto
CreationRepositoryNode=3379
CreationButtonText=Crea nuovo comunicato stampa
RepositoryNodes[]
RepositoryNodes[]=3379
AttributeIdentifiers[]
#AttributeIdentifiers[images]=images
#AttributeIdentifiers[videos]=video
#AttributeIdentifiers[audios]=audio
#AttributeIdentifiers[tags]=argomento
StateGroup=comunicati
States[draft]=Bozza
States[pending]=In attesa di pubblicazione
States[published]=Pubblicato
Actions[]
Actions[draft-pending]=NotifyGroup;3382
Actions[pending-draft]=NotifyOwner
Actions[pending-published]=AddLocationFromRelationList;locations|NotifyOwner
Actions[published-pending]=RemoveLocationFromRelationList;locations|NotifyOwner


[AvailableActions]
Actions[]
Actions[]=AddLocation
Actions[]=RemoveLocation
Actions[]=NotifyOwner
Actions[]=NotifyGroup
Actions[]=AddLocationFromRelationList
Actions[]=RemoveLocationFromRelationList

[AddLocation]
#esempio: Actions[draft-published]=AddLocation;<node_id>;<node_id>;...
ClassName=OCEditorialStuffActionHandler
MethodName=addLocation

[RemoveLocation]
#esempio: Actions[draft-published]=RemoveLocation;<node_id>;<node_id>;...
ClassName=OCEditorialStuffActionHandler
MethodName=removeLocation

[NotifyOwner]
#esempio: Actions[draft-published]=NotifyOwner
ClassName=OCEditorialStuffActionHandler
MethodName=notifyOwner

[NotifyGroup]
#esempio: Actions[draft-published]=NotifyGroup;<group_node_id>;<group_node_id>;...
ClassName=OCEditorialStuffActionHandler
MethodName=notifyGroup

[AddLocationFromRelationList]
#esempio: Actions[draft-published]=AddLocationFromRelationList;<attribute_identifier>
ClassName=OCEditorialStuffActionHandler
MethodName=addLocationFromRelationList

[RemoveLocationFromRelationList]
#esempio: Actions[draft-published]=RemoveLocationFromRelationList;<attribute_identifier>
ClassName=OCEditorialStuffActionHandler
MethodName=removeLocationFromRelationList


*/ ?>