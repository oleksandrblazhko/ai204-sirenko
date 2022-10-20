@startuml
title UML-діаграма розгортання ПП

left to right direction

skinparam componentStyle uml1

node "<<Настільний комп'ютер>>" as comp {
	node "<<OS Windows OS Linux>>" {
		node "<<Графічний редактор>>" {
			component [.cpp(Qt)]
		}
	}
}

interface "Сенсорний екран"

(Сенсорний екран) -- comp

node "<<Server #1>>" as serv1 {
	node "<<OS Linux>>" {
		node "<<Python>>" {
			component [.py]
		}
	}
}

comp -- serv1

node "<<Server #2>>" as serv2 {
	node "<<OS  Linux>>" {
		node "<<Database Server PostgreSQL>>" {
			database "Relation Database"
		}
	}
}

serv1 -- serv2
@enduml
