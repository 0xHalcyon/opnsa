removejunk() {
        local l=$1
        awk 'BEGIN{f=0}
        {
                match($0,"<congress_numbers>")
                if(RSTART){
                        print substr($0,1,RSTART-1)
                        f=1
                        next
        }
        match($0,"<current>")
        if(RSTART){
                $0=substr($0,RSTART)
                f=0
                }
        }
        f==0{print}
        ' $l
}


removejunk 113_congress.xml
