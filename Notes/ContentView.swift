//
//  ContentView.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 10/12/25.
//

import SwiftUI
import Combine
import CoreData


struct Note: Identifiable {
	let id = UUID()
	let title: String
	let body: String
	let date: Date
}


class ContentViewController: ObservableObject {
	
	let container: NSPersistentContainer
	
	var viewContext: NSManagedObjectContext {
		return container.viewContext
	}
	
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
	
	func deleteNote() {
		
	}
	
	func fetchAllNotes() {
		
	}
	
	func editNote() {
		
	}
	
}


struct ContentView: View {
	
	@StateObject var controller = ContentViewController()
	
	var body: some View {
		
		ForEach(controller.notes) { note in
			Text("\(note.title)")
		}
		
		Button("Adicionar nota") {
			let newNote = Note(title: "Nova nota!", body: "Corpo da nova nota", date: Date.now)
			controller.addNewNote(note: newNote)
		}
		
	}
}

#Preview {
	ContentView()
}
