signature TreeSig = sig
    type tree;
    val empty: tree;
    val insert: tree * int -> tree;
    val from_list: int list -> tree;
    val contains: tree * int -> bool;
end
structure Tree :> TreeSig = struct
    datatype tree = Tree of tree * int * tree | Leaf;

    fun insert(Leaf, e:int) = Tree(Leaf, e, Leaf)
    |insert(Tree(lt, v, rt), e) =
        if e < v then Tree(insert(lt, e), v, rt)
        else if e > v then Tree(lt, v, insert(rt, e))
        else Tree(lt, v, rt);

    val empty = Leaf;
    fun from_list(lst: int list)=
        case lst of
        [] => empty
        |head::tail => insert(from_list(tail), head)
    infix tin;
    fun contains(t:tree, e)=
        case t of
        Leaf => false
        | Tree(l,v,r) => e = v orelse if e > v then contains(r, e) else contains(l, e) 
end

