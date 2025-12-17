//
//  ContentViewController.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/12/25.
//

import Foundation
import Combine
import CoreData


// Controller
class ContentViewController: ObservableObject {
	
//	let container: NSPersistentContainer
//
//	var viewContext: NSManagedObjectContext {
//		return container.viewContext
//	}
	
//	let dataController
	
	@Published var notes: [Note] = [
		Note(title: "Boa noite!", body: "Este é o corpo da nota de boa noite.", date: Date.now),
		Note(title: "Aula de persistência", body: "Veremos CoreData pela primeira vez", date: Date.now),
		Note(title: "Terceira Nota", body: "Corpo da terceira nota", date: Date.now)
	]

	
	// CRUD
	
	// Create
	func addNewNote(note: Note) {
		self.notes.append(note)
	}
	
	// Read
	func fetchAllNotes() -> [Note] {
		return self.notes
	}
	
	func editNote() {
		if notes.isEmpty {
			return
		}
		
		let newTitle = "Título alterado!"
		let newDate = Date.now.addingTimeInterval(3600000)
		let newBody = "O corpo desta nota foi alterado com sucesso!"
		
		notes[0].title = newTitle
		notes[0].date = newDate
		notes[0].body = newBody
	}
	
	func deleteNote() {
		if notes.isEmpty {
			return
		}
		self.notes.removeLast()
	}
	
}
