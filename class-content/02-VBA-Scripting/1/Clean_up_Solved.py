import os
import shutil
import glob 

def listdir_nohidden(path):
    return glob.glob(os.path.join(path, '*'))

Activities_folder = listdir_nohidden('./Activities')


individual_activity_file_path = []




for folder in Activities_folder:
    
    for file in os.listdir(folder):
        print(file)
        if file == 'Solved':
            path = os.path.join(folder_path,file)
            shutil.rmtree(path)

 
        
    
    