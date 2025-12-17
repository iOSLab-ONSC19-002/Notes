//
//  ContentView.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 10/12/25.
//

import SwiftUI


// View
struct ContentView: View {
	
	@StateObject var controller = ContentViewController()
	
	var body: some View {
		
		ScrollView {
			ForEach(controller.notes) { note in
				NoteCard(note: note)
			}
		}
		
		
		HStack(spacing: 25) {
			// Create
			Button {
				let newNote = Note(title: "Nova nota!", body: "Corpo da nova nota", date: Date.now)
				controller.addNewNote(note: newNote)
			} label: {
				Image(systemName: "plus")
			}
			// Read -> ainda não terá nada...
			Button {
				
			} label: {
				Image(systemName: "square.and.arrow.down")
			}
			// Update
			Button {
				controller.editNote()
			} label: {
				Image(systemName: "pencil")
			}
			// Delete
			Button {
				controller.deleteNote()
			} label: {
				Image(systemName: "trash")
			}
		}
		.font(.title)
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 999)
				.foregroundStyle(.secondary.opacity(0.2))
				.shadow(radius: 2)
		)
		
	}
}

#Preview {
	ContentView()
}


