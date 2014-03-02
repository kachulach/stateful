package mk.ukim.finki.mp.stateful.validator;

import mk.ukim.finki.mp.stateful.model.UploadedFile;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


public class FileValidator implements Validator { 

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object uploadedFile, Errors errors) {

		UploadedFile file = (UploadedFile) uploadedFile;
		if (file.getFile().getSize() == 0) {
			errors.rejectValue("file", "uploadForm.salectFile",
					"Please select a file!");
		}		
	}  
	  
} 
