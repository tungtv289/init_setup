for x in $(ls ~/Library/Containers/) 
do 
    echo "Cleaning ~/Library/Containers/$x/Data/Library/Caches/"
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/*
    echo "✅ Done Cleaning ~/Library/Containers/$x/Data/Library/Caches"
done