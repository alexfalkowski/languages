import std.stdio;

void main() {
    write("How many students are there? ");
    int studentCount;
    readf(" %s", &studentCount);
    write("How many teachers are there? ");
    int teacherCount;
    readf(" %s", &teacherCount);
    writeln("Got it: There are ", studentCount, " students", " and ", teacherCount, " teachers.");
}
