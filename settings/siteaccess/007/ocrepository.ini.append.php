<?php /* #?ini charset="utf-8"?

[Client]
AvailableRepositories[]
AvailableRepositories[]=deliberazioni
AvailableRepositories[]=comunicati
AvailableRepositories[]=immagini
AvailableRepositories[]=video
AvailableRepositories[]=audio
AvailableRepositories[]=dipendente
AvailableRepositories[]=area
AvailableRepositories[]=servizio
AvailableRepositories[]=ufficio

[Client_comunicati]
Url=http://stampa.pat.opencontent.it
Name=Comunicati stampa

[Client_deliberazioni]
Url=http://delibere.pat.opencontent.it
Name=Deliberazioni

[Client_immagini]
Url=http://stampa.pat.opencontent.it
Name=Immagini

[Client_video]
Url=http://stampa.pat.opencontent.it
Name=Video

[Client_audio]
Url=http://stampa.pat.opencontent.it
Name=Audio

[Client_dipendente]
Url=http://catasto.pat.opencontent.it
Name=Dipendenti

[Server_dipendente]
Handler=OCRepositoryContentClassServer
Parameters[ClassIdentifier]=dipendente

[Client_area]
Url=http://catasto.pat.opencontent.it
Name=Dipartimenti

[Server_area]
Handler=OCRepositoryContentClassServer
Parameters[ClassIdentifier]=area

[Client_servizio]
Url=http://catasto.pat.opencontent.it
Name=Servizi    

[Server_servizio]
Handler=OCRepositoryContentClassServer
Parameters[ClassIdentifier]=servizio

[Client_ufficio]
Url=http://catasto.pat.opencontent.it
Name=Uffici

[Server_ufficio]
Handler=OCRepositoryContentClassServer
Parameters[ClassIdentifier]=ufficio


*/?>