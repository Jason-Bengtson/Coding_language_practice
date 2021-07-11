package social;

public class hub {
    private addFriend pieces;

    public hub(addFriend newFriend) {
        setFriend(newFriend);
        
    }

    void setFriend(addFriend newFriend) {
        this.pieces = newFriend;
    }
    public void connectToFriend(String friend)
    {
        System.out.println(pieces.add(friend));
    }

}
