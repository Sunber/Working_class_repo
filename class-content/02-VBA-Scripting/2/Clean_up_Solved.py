import os
import shutil
import glob 

Activities_folder = os.listdir('./Activities')

individual_activity_file_path = []


def listdir_nohidden(path):
    return glob.glob(os.path.join(path, '*'))

for folder in Activities_folder:
    folder_path = os.path.join('./Activities',folder)
    
    for file in listdir_nohidden(folder_path):
        if file == 'Solved':
            path = os.path.join(folder_path,file)
            shutil.rmtree(path)

 
        
    
    