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
	
	// Onde os objetos são salvos
	let container: NSPersistentContainer
	
	// O contexto que está sendo salvo
	var context: NSManagedObjectContext {
		return container.viewContext
	}
	
	@Published var noteEntities: [NoteEntity] = []
	
	@Published var notes: [Note] = [
		Note(title: "Boa noite!", body: "Este é o corpo da nota de boa noite.", date: Date.now),
		Note(title: "Aula de persistência", body: "Veremos CoreData pela primeira vez", date: Date.now),
		Note(title: "Terceira Nota", body: "Corpo da terceira nota", date: Date.now)
	]
	
	init() {
		container = NSPersistentContainer(name: "Model")
		
		container.loadPersistentStores { description, error in
			if let error = error {
				print("CoreData failed to load: \(error)")
			}
		}
	}
	
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

// Métodos CRUD CoreData
extension ContentViewController {
	
	func createNoteEntity() {
		let newNote = NoteEntity(context: self.context)
		newNote.id = UUID()
		newNote.title = "Nota criada por CoreData"
		newNote.date = Date.now
		newNote.body = "Corpo feito por CoreData"
		
		do {
			try context.save()
			self.noteEntities.append(newNote)
		} catch {
			print(error)
		}
	}
	
	func fetchNoteEntities() {
//		let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
		let request2: NSFetchRequest<NoteEntity> = NoteEntity.fetchRequest()
		
		do {
			let result: [NoteEntity] = try context.fetch(request2)
			self.noteEntities = result
		} catch {
			print(error)
		}
	}
	
	func editNoteEntity() {
		if noteEntities.isEmpty {
			return
		}
		
		let newTitle = "Título alterado no CoreData!"
		let newDate = Date.now.addingTimeInterval(3600000)
		let newBody = "O corpo desta nota foi alterado com sucesso no CoreData!"
		
		noteEntities[0].title = newTitle
		noteEntities[0].date = newDate
		noteEntities[0].body = newBody
		
		do {
			try context.save()
		} catch {
			print(error)
		}
	}
	
	func deleteNoteEntity() {
		if noteEntities.isEmpty {
			return
		}
		
		context.delete(noteEntities.last!)
		noteEntities.removeLast()
		
		do {
			try context.save()
		} catch {
			print(error)
		}
	}
}
