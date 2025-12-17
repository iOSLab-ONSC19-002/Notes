//
//  CoreDataModelsView.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/12/25.
//

import SwiftUI

struct CoreDataModelsView: View {
	
	@StateObject var controller = ContentViewController()
	
	var body: some View {
		ScrollView {
			ForEach(controller.noteEntities) { note in
				NoteEntityCard(note: note)
			}
		}
		.onAppear {
			controller.fetchNoteEntities()
		}
		
		HStack(spacing: 25) {
			// Create
			Button {
				controller.createNoteEntity()
			} label: {
				Image(systemName: "plus")
			}
			// Read -> Busca as notas salvas
			Button {
				controller.fetchNoteEntities()
			} label: {
				Image(systemName: "square.and.arrow.down")
			}
			// Update
			Button {
				controller.editNoteEntity()
			} label: {
				Image(systemName: "pencil")
			}
			// Delete
			Button {
				controller.deleteNoteEntity()
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
	CoreDataModelsView()
}
