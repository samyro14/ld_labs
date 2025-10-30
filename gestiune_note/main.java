import java.io.*;
import java.util.Arrays;
class Main {
    public static void main(String[] argv) {

        // 1. Incarcam curicula
        Curicula curicula = Curicula.load("cursuri.txt");
        System.out.println("--- CURICULA INCARCATA ---");
        System.out.println(curicula);

        // 2. Cautam niste cursuri din curicula ca sa le folosim
        Curs mate = curicula.cauta(1);
        Curs info = curicula.cauta(2);
        Curs fizica = curicula.cauta(3);

        // Verificam daca le-am gasit
        if (mate == null || info == null || fizica == null) {
            System.out.println("Eroare: Cursurile cu ID 1, 2 sau 3 nu exista in cursuri.txt");
            return;
        }

        // 3. Cream 2 studenti
        Student student1 = new Student("Popescu Ion");
        Student student2 = new Student("Ionescu Ana");

        // 4. Inregistram note
        student1.inregistrareNota(mate, 8);
        student1.inregistrareNota(info, 10);
        student1.inregistrareNota(fizica, 4); // Nota de 4 (nu se va inregistra)
        student1.inregistrareNota(mate, 9);   // Actualizare nota la mate de la 8 la 9

        student2.inregistrareNota(info, 7);
        student2.inregistrareNota(fizica, 9);
        student2.inregistrareNota(mate, 5);

        // 5. Tiparim datele studentilor
        System.out.println("--- DATE STUDENT 1 ---");
        System.out.println(student1);

        System.out.println("--- DATE STUDENT 2 ---");
        System.out.println(student2);
    }
}

class Curs{
    private String nume;
    private int id;
    private int cod;
    private int credite;
    public Curs(String nume, int id, int cod, int credite) {
        this.nume = nume;
        this.id = id;
        this.cod = cod;
        this.credite = credite;
    }
    public boolean equals(Object obj) {
        if (obj instanceof Curs){
            return this.cod == ((Curs)obj).cod;
        }
        else{
            return false;
        }
    }
    public int getCredite(){
        return credite;
    }
    public int getId(){
        return id;
    }
    public String toString(){
        return "ID: " + id + " Nume: " + nume + " Credite: " + credite + " Cod: " + cod;
    }
}
class Student{
    private String nume_student;
    private Curs[] courses = new Curs[10];
    private int size_courses = 0;
    private int[] grades = new int[10];
    public Student(String nume_student){
        this.nume_student = nume_student;
    }
    public void inregistrareNota(Curs curs, int nota){
        if(nota >= 5 && nota <= 10){
            for(int i = 0; i < size_courses; i++){
                if(courses[i].equals(curs)){
                    grades[i] = nota;
                    return;
                }
            }
            if(size_courses == courses.length){
                courses = Arrays.copyOf(courses, size_courses * 2);
                grades = Arrays.copyOf(grades, size_courses * 2);
            }
            courses[size_courses] = curs;
            grades[size_courses] = nota;
            size_courses++;
        }
    }
    public int getCrediteTotal(){
        int total = 0;
        for(int i = 0; i < size_courses; i++){
            total += courses[i].getCredite();
        }
        return total;
    }
    public double getMean(){
        double total = 0;
        for(int i = 0; i < size_courses; i++){
            total += grades[i];
        }
        if(size_courses == 0)
            return 0;
        return total / size_courses;
    }
    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(nume_student);
        sb.append("\n");
        for(int i = 0; i < size_courses; i++){
            sb.append(courses[i]);
            sb.append("\n");
            sb.append("Nota: ");
            sb.append(grades[i]);
            sb.append("\n");
        }
        sb.append("Credite total: ");
        sb.append(getCrediteTotal());
        sb.append("\n");
        sb.append("Mean: ");
        sb.append(getMean());
        sb.append("\n");
        return sb.toString();
    }

}
class Curicula{
    private Curs[] courses = new Curs[10];
    private int number_courses = 0;

    public void add(Curs c){
        if(number_courses == courses.length){
            Curs[] newArray = new Curs[courses.length * 2];
            // System.arraycopy(courses, 0, newArray, 0, courses.length);
            for(int i = 0; i < courses.length; i++){
                newArray[i] = courses[i];
            }
            courses = newArray;
        }
        courses[number_courses++] = c;
    }

    public String toString(){
        String tmp = "";
        for(int i = 0; i < number_courses; ++i){
            tmp += courses[i].toString() + '\n';
        }
        return tmp;
    }
    public Curs cauta(int id){
        for(int i = 0; i < number_courses; ++i){
            if(courses[i].getId() == id){
                return courses[i];
            }
        }
        return null;
    }
    public static Curicula load(String filename){
        Curicula curicula = new Curicula();
        try{
            FileInputStream fis = new FileInputStream(filename);
            BufferedReader br = new BufferedReader(new InputStreamReader(fis));

            String line = "";
            int id = 0, cod = 0, credite = 0;
            String nume = "";
            int i = 0;
            while((line = br.readLine()) != null){
                //0 : id
                //1 : nume
                //2 : cod
                //3: credite
                id = Integer.parseInt(line);
                line = br.readLine();
                nume = line;
                line = br.readLine();
                cod = Integer.parseInt(line);
                line = br.readLine();
                credite = Integer.parseInt(line);
                Curs c = new Curs(nume, id, cod, credite);
                curicula.add(c);
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return curicula;
    }
    
}