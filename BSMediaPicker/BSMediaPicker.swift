//
//  BSMediaPicker.swift
//  BSMediaPicker
//
//  Created by Brandon Stillitano on 7/2/20.
//  Copyright © 2020 Brandon Stillitano. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

public enum MediaPickerType: String {
    case photos
    case videos
    case photosVideos
}

public protocol MediaPickerDelegate: NSObjectProtocol {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController)
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL])
}

public class MediaPicker: NSObject {
    //Data
    var viewController: UIViewController? = nil
    var imagePicker: UIImagePickerController = UIImagePickerController()
    var documentPicker = UIDocumentPickerViewController(documentTypes: [(kUTTypeImage as String), (kUTTypeMovie as String)], in: .import)

    //Delegate
    public weak var delegate: MediaPickerDelegate? = nil

    public override init() {
        super.init()
    }

    public func showMediaPicker(from presentingViewController: UIViewController, type: MediaPickerType = .photosVideos) {
        //Set Data
        self.viewController = presentingViewController

        //Create Alert
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        //Add Library Action
        let libraryAction: UIAlertAction = UIAlertAction(title: "Photo & Video Library", style: .default) { (action) in
            self.presentLibraryPicker(type: type)
        }
        libraryAction.setValue(UIImage(named: "gallery_picker_library"), forKey: "image")
        libraryAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        alertController.addAction(libraryAction)

        //Add Cloud Action
        let cloudAction: UIAlertAction = UIAlertAction(title: "Other Locations", style: .default) { (action) in
            self.presentDocumentPicker(type: type)
        }
        cloudAction.setValue(UIImage(named: "gallery_picker_cloud"), forKey: "image")
        cloudAction.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        alertController.addAction(cloudAction)

        //Add Cancel Action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        //Show Alert
        self.viewController?.present(alertController, animated: true, completion: nil)
    }

    private func presentLibraryPicker(type: MediaPickerType) {
        //Setup Types
        var pickerTypes: [String] = []
        switch type {
        case .photos:
            pickerTypes.append(kUTTypeImage as String)
            break

        case .videos:
            pickerTypes.append(kUTTypeMovie as String)
            break

        case .photosVideos:
            pickerTypes.append(kUTTypeImage as String)
            pickerTypes.append(kUTTypeMovie as String)
            break

        default:
            break
        }

        //Setup Picker
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = pickerTypes
        imagePicker.allowsEditing = true
        self.viewController?.present(imagePicker, animated: true, completion: nil)
    }

    private func presentDocumentPicker(type: MediaPickerType) {
        //Setup Types
        var documentTypes: [String] = []
        switch type {
        case .photos:
            documentTypes.append(kUTTypeImage as String)
            break

        case .videos:
            documentTypes.append(kUTTypeMovie as String)
            break

        case .photosVideos:
            documentTypes.append(kUTTypeImage as String)
            documentTypes.append(kUTTypeMovie as String)
            break

        default:
            break
        }

        //Setup Picker
        documentPicker = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        self.viewController?.present(documentPicker, animated: true, completion: nil)
    }
}

extension MediaPicker: UIImagePickerControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        //Dismiss Picker Controller
        picker.dismiss(animated: true) {
            self.delegate?.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
        }
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss Picker Controller
        picker.dismiss(animated: true) {
            self.delegate?.imagePickerControllerDidCancel(picker)
        }
    }
}

extension MediaPicker: UIDocumentPickerDelegate {
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        delegate?.documentPickerWasCancelled(controller)
    }

    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        delegate?.documentPicker(controller, didPickDocumentsAt: urls)
    }
}

extension MediaPicker: UINavigationControllerDelegate {
    //Redundant delegate impleneted as part of UIImagePickerControllerDelegate
}

extension Bundle {
    public static var mainBundle: Bundle? {
        //Check Data
        guard let urlString = Bundle.main.path(forResource: "BSMediaPicker", ofType: "framework", inDirectory: "Frameworks") else {
            return nil
        }
        return Bundle(url: URL(fileURLWithPath: urlString))
    }
}
