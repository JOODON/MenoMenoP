package BBS;

public class Testbbs {
    public static void main(String[] args) {
        BBS bbs=new BBS();
        BBSDAO bbsdao=new BBSDAO();;
        bbsdao.getList(0);

        System.out.println(bbs.getBbsTitle());
    }
}
