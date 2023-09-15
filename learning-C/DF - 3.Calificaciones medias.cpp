//NOTAS MEDIAS *****************************************************************
//LIBRERIAS --------------------------------------------------------------------
#include <stdio.h>
#include <conio.h>
#include <string.h>

#define NALU 5
#define NASI 3

//SOLICITAR CALIFICACIONES -----------------------------------------------------
void
solicitarcalificaciones(float calif[NALU][NASI]){
    int i,j;
    
    for(i=0;i<NALU;i++){
        printf("Alumno %d\n",i+1);
        for(j=0;j<NASI;j++){
            //Solicitamos la nota entre 0 y 10
            do{
                printf("Calificacion de la asignatura %d:",j+1);
                scanf("%f",&calif[i][j]);
            }while(calif[i][j]<0 || calif[i][j]>10);
        }
    }
    return;
}

//MEDIA ALUMNOS ----------------------------------------------------------------
void
mediaalumnos(float calif[NALU][NASI]){
    int i,j;
    for(i=0;i<NALU;i++){
        float media=0;
        for(j=0;j<NASI;j++){
            media+=calif[i][j];
        }
        media/=NASI;
        printf("Nota media del alumno %d: %f\n",i+1,media);
    }
    return;
}

//MEDIA ASIGNATURAS ------------------------------------------------------------
void
mediaasignaturas(float calif[NALU][NASI]){
    int i,j;
    for(j=0;j<NASI;j++){
        float media=0;
        for(i=0;i<NALU;i++){
            media+=calif[i][j];
        }
        media/=NALU;
        printf("Nota media de la asignatura %d: %f\n",j+1,media);
    }
    return;
}

//MEDIA TOTAL ------------------------------------------------------------------
void
mediatotal(float calif[NALU][NASI]){
    int i,j;
    
    float media=0;
    for(i=0;i<NASI;i++){
        for(j=0;j<NALU;j++){
            media+=calif[i][j];
        }
    }
    media/=(NALU*NASI);
    printf("Nota media del curso: %f\n",media);
    return;
}

//PROBLEMA ---------------------------------------------------------------------
void
problema(void){
    float calif[NALU][NASI];
    solicitarcalificaciones(calif);
    mediaalumnos(calif);
    mediaasignaturas(calif);
    mediatotal(calif);
    return;
}


//MAIN**************************************************************************
int
main(void){
    problema();
    getche();
    return(0);
}
