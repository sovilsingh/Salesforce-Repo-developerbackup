public class newWapperDemo 
{
    public FavHerione objectfavheo {get;set;}
    
    public List<FavHerione> stwap {get;set;}
    
    public newWapperDemo()
    {
        stwap = new List<FavHerione>();
        objectfavheo = new FavHerione();
        objectfavheo.sName = 'Sunny Leone';
        stwap.add(objectfavheo);
        
        objectfavheo = new FavHerione();
        objectfavheo.sName = 'Deepika';
        stwap.add(objectfavheo);
    }
      
    public class FavHerione
    {
        public string sName {get;set;}
    }
}